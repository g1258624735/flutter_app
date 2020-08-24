import 'dart:async';

import 'package:flutter/material.dart';

import 'TikTokFavoriteAnimationIcon.dart';

/// 视频手势封装
/// 单击：暂停
/// 双击：点赞，双击后再次单击也是增加点赞爱心
class TikTokVideoGesture extends StatefulWidget {
  const TikTokVideoGesture({
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

class _TikTokVideoGestureState extends State<TikTokVideoGesture> {
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

  @override
  void initState() {
    super.initState();
    myTimer = Timer(Duration(milliseconds: 200), () {
      showLove();
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
      },
      onTapUp: (detail) {
        showLove();
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

  void showLove() {
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
