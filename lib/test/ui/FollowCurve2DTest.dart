//import 'package:fluttertoast/fluttertoast.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 测试动画
final CatmullRomSpline path = CatmullRomSpline(
  const <Offset>[
    Offset(0.05, 0.75),
    Offset(0.18, 0.23),
    Offset(0.32, 0.04),
    Offset(0.73, 0.5),
    Offset(0.42, 0.74),
    Offset(0.73, 0.01),
    Offset(0.93, 0.93),
    Offset(0.05, 0.75),
  ],
  startHandle: Offset(0.93, 0.93),
  endHandle: Offset(0.18, 0.23),
  tension: 0.0,
);

class FollowCurve2DTest extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FollowCurve2DTestState();
  }
}

class _FollowCurve2DTestState extends State {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      alignment: Alignment.center,
      child: FollowCurve2D(
        path: path,
        curve: Curves.easeInOut,
        duration: const Duration(seconds: 3),
        child: CircleAvatar(
          backgroundColor: Colors.yellow,
          child: DefaultTextStyle(
            style: Theme.of(context).textTheme.headline6,
            child: Text("B"), // Buzz, buzz!
          ),
        ),
      ),
    );
  }
}

Widget build(BuildContext context) {
  return Container(
    color: Colors.white,
    alignment: Alignment.center,
    child: FollowCurve2D(
      path: path,
      curve: Curves.easeInOut,
      duration: const Duration(seconds: 3),
      child: CircleAvatar(
        backgroundColor: Colors.yellow,
        child: DefaultTextStyle(
          style: Theme.of(context).textTheme.headline6,
          child: Text("B"), // Buzz, buzz!
        ),
      ),
    ),
  );
}

class FollowCurve2D extends StatefulWidget {
  const FollowCurve2D({
    Key key,
    @required this.path,
    this.curve = Curves.easeInOut,
    @required this.child,
    this.duration = const Duration(seconds: 1),
  })  : assert(path != null),
        assert(curve != null),
        assert(child != null),
        assert(duration != null),
        super(key: key);
  final Curve2D path;
  final Curve curve;
  final Duration duration;
  final Widget child;

  @override
  _FollowCurve2DState createState() => _FollowCurve2DState();
}

class _FollowCurve2DState extends State<FollowCurve2D>
    with TickerProviderStateMixin {
  // The animation controller for this animation.
  AnimationController controller;

  // The animation that will be used to apply the widget's animation curve.
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(duration: widget.duration);
    animation = CurvedAnimation(parent: controller, curve: widget.curve);
    // Have the controller repeat indefinitely.  If you want it to "bounce" back
    // and forth, set the reverse parameter to true.
    controller.repeat(reverse: false);
    controller.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    super.dispose();
    // Always have to dispose of animation controllers when done.
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Scale the path values to match the -1.0 to 1.0 domain of the Alignment widget.
    final Offset position =
        widget.path.transform(animation.value) * 2.0 - Offset(1.0, 1.0);
    return Align(
      alignment: Alignment(position.dx, position.dy),
      child: widget.child,
    );
  }
}
