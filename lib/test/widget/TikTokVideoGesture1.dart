import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

import 'TikTokFavoriteAnimationIcon.dart';

/// 视频手势封装
/// 单击：暂停
/// 双击：点赞，双击后再次单击也是增加点赞爱心
class TikTokVideoGesture1 extends StatefulWidget {
  const TikTokVideoGesture1({
    Key key,
    @required this.child,
    this.onAddFavorite,
    this.onSingleTap,
  }) : super(key: key);

  final Function onAddFavorite;
  final Function onSingleTap;
  final Widget child;

  @override
  _TikTokVideoGestureState createState() => _TikTokVideoGestureState();
}

class _TikTokVideoGestureState extends State<TikTokVideoGesture1> {
  GlobalKey _key = GlobalKey();

  // 内部转换坐标点
  Offset _p(Offset p) {
    RenderBox getBox = _key.currentContext.findRenderObject();
    return getBox.globalToLocal(p);
  }

  List<Offset> icons = [];

  bool canAddFavorite = false;
  bool justAddFavorite = false;
  Timer timer;
  Timer myTimer;
  int startPoint = 300;
  int nextInt = 30;
  Random random = Random();
  @override
  void initState() {
    super.initState();
    myTimer = Timer.periodic(Duration(milliseconds: 2000), (timer) {
      if(startPoint<=200){
        startPoint=300;
      }
      startPoint = startPoint-10;
      setState(() {
        print("添加了爱心");
        icons.add(Offset( 250-14+(random.nextInt(nextInt))*1.00,250-5-(random.nextInt(nextInt))*1.00));
//        icons.add(Offset( 250+10+(random.nextInt(nextInt))*1.00,250-4-(random.nextInt(nextInt))*1.00));
//
//        icons.add(Offset( 250-18+(random.nextInt(nextInt))*1.00,250-40-(random.nextInt(nextInt))*1.00));
//        icons.add(Offset( 250+22+(random.nextInt(nextInt))*1.00,250-43-(random.nextInt(nextInt))*1.00));
//
//
      });
    });
  }

  @override
  void dispose() {
    myTimer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var iconStack = Stack(
      children: icons
          .map<Widget>(
            (p) => TikTokFavoriteAnimationIcon(
              key: Key(p.toString()),
              position: p,
              onAnimationComplete: () {
                icons.remove(p);
              },
            ),
          )
          .toList(),
    );
    return GestureDetector(
      key: _key,
      onTapDown: (detail) {
        showLove(detail);
      },
      onTapUp: (detail) {
//        disLove();
      },
      onTapCancel: () {
        print('onTapCancel');
      },
      child: Stack(
        children: <Widget>[
          widget.child,
          iconStack,
        ],
      ),
    );
  }

  void showLove(TapDownDetails detail) {
    setState(() {
      if (canAddFavorite) {
        print('添加爱心，当前爱心数量:${icons.length}');
        icons.add(_p(detail.globalPosition));
        widget.onAddFavorite?.call();
        justAddFavorite = true;
      } else {
        justAddFavorite = false;
      }
    });
  }

  void disLove() {
    timer?.cancel();
    var delay = canAddFavorite ? 600 : 300;
    timer = Timer(Duration(milliseconds: delay), () {
      canAddFavorite = false;
      timer = null;
      if (!justAddFavorite) {
        widget.onSingleTap?.call();
      }
    });
    canAddFavorite = true;
  }
}
