import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/test/widget/diff_scale_text.dart';
import 'package:flutter_app/test/widget/mole_widget.dart';

///测试  Flare 动画   有别于线性动画和自定义动画
class FlareAnimation extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FlareAnimationState();
  }
}

class _FlareAnimationState extends State {
  bool hadInit = false;

  String text = "";
  double fontSize = 56;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (hadInit) {
      return;
    }
    hadInit = true;

    ///防止多次进入
    new Future.delayed(const Duration(milliseconds: 500), () {
      if (mounted) {
        setState(() {
          text = "Welcome";
          fontSize = 40;
        });
      }
    });
    new Future.delayed(const Duration(seconds: 1, milliseconds: 500), () {
      if (mounted) {
        setState(() {
          text = "GSYGithubApp";
          fontSize = 40;
        });
      }
    });
    new Future.delayed(const Duration(seconds: 2, milliseconds: 500), () {});
  }

  @override
  Widget build(BuildContext context) {
    double size = 200;
    return Column(children: <Widget>[
      Align(
        alignment: Alignment(0.0, 0.3),
        child: DiffScaleText(
          text: text,
          textStyle: TextStyle(fontSize: fontSize, color: Colors.green),
        ),
      ),
      Align(
        alignment: Alignment(0.0, 0.8),
        child: Mole(),
      ),
      Align(
        alignment: Alignment.bottomCenter,
        child: new Container(
          width: size,
          height: size,
//          child: new FlareAnimation("file/flare_flutter_logo_.flr",
//              alignment: Alignment.topCenter,
//              fit: BoxFit.fill,
//              animation: "Placeholder"),
        ),
      ),
      Align(
        alignment: Alignment.bottomCenter,
        child: new Container(
          width: size,
          height: size,
//          child: new FlareActor("file/Space-Demo.flr",
//              alignment: Alignment.topCenter,
//              fit: BoxFit.fill,
//              animation: "Placeholder"),
        ),
      )
    ]);
  }
}
