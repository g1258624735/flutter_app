import 'package:flutter/material.dart';
import 'dart:math';

///圆形进度条
///author gxj
///date 2020.4.21
class MyCircleProgressWidget extends StatefulWidget {
  final MyProgress progress;

  MyCircleProgressWidget({Key key, this.progress}) : super(key: key);

  @override
  _MyCircleProgressWidgetState createState() => _MyCircleProgressWidgetState();
}

///信息描述类 [value]为进度，在0~1之间,进度条颜色[color]，
///未完成的颜色[backgroundColor],圆的半径[radius],线宽[strokeWidth]
///小点的个数[dotCount] 样式[style] 完成后的显示文字[completeText]
class MyProgress {
  double value;
  Color color;
  Color backgroundColor;
  double radius;
  double strokeWidth;
  int dotCount;
  TextStyle style;
  String completeText;

  MyProgress(
      {this.value,
      this.color,
      this.backgroundColor,
      this.radius,
      this.strokeWidth,
      this.completeText = "100%",
      this.style,
      this.dotCount = 40});
}

class _MyCircleProgressWidgetState extends State<MyCircleProgressWidget> {
  @override
  Widget build(BuildContext context) {
    var progress = Container(
      width: widget.progress.radius * 2,
      height: widget.progress.radius * 2,
      child: CustomPaint(
        painter: ProgressPainter(widget.progress),
      ),
    );
    String txt = "${(100 * widget.progress.value).toStringAsFixed(1)} %";
    var text = Text(
      widget.progress.value == 1.0 ? widget.progress.completeText : txt,
      style: widget.progress.style ??
          TextStyle(
              fontSize: widget.progress.radius / 4,
              fontWeight: FontWeight.bold),
    );
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[progress, text],
    );
  }
}

class ProgressPainter extends CustomPainter {
  MyProgress _progress;
  Paint _paint;
  Paint _arrowPaint;
  Paint _circlePaint;
  Path _arrowPath;
  double _radius;
  double _radiusS;

  ProgressPainter(
    this._progress,
  ) {
    _arrowPath = Path();
    _arrowPaint = Paint();
    _circlePaint = Paint();
    _paint = Paint();
    _radius = _progress.radius - _progress.strokeWidth / 2;
  }

  @override
  void paint(Canvas canvas, Size size) {
    //画布准备
    Rect rect = Offset.zero & size;
    canvas.clipRect(rect); //裁剪区域
    canvas.translate(_progress.strokeWidth / 2, _progress.strokeWidth / 2);
    canvas.save();

    //起始点旋转的角度
    double angle = -144;
//----------- 内层圆形进度绘制-------------------
    _radiusS = _progress.radius - _progress.strokeWidth * 2;
    _paint
      ..style = PaintingStyle.stroke
      ..color = _progress.backgroundColor
      ..isAntiAlias = true //是否启动抗锯齿
      ..strokeWidth = _progress.strokeWidth *3
      ..strokeCap = StrokeCap.butt;
    double sweepAngleS = 288; //完成角度
    canvas.drawArc(
        Rect.fromLTRB(
            _progress.strokeWidth + 10,
            _progress.strokeWidth + 10,
            _radiusS * 2 + _progress.strokeWidth * 2 - 10,
            _radiusS * 2 + _progress.strokeWidth * 2 - 10),
        (angle - 90) / 180 * pi,
        sweepAngleS / 180 * pi,
        false,
        _paint);

    canvas.restore();
    canvas.save();
    //----------- 内层圆形进度绘制-------------------

    //----------- 最外层圆形进度绘制-------------------
    _paint
      ..style = PaintingStyle.stroke
      ..color = _progress.color
      ..isAntiAlias = true //是否启动抗锯齿
      ..strokeWidth = _progress.strokeWidth
      ..strokeCap = StrokeCap.round;

    double sweepAngle = _progress.value * 288; //完成角度
    canvas.drawArc(Rect.fromLTRB(10, 10, _radius * 2 - 10, _radius * 2 - 10),
        (angle - 90) / 180 * pi, (sweepAngle) / 180 * pi, false, _paint);
    canvas.restore();
    canvas.save();
    //----------- 最外层圆形进度绘制-------------------
    //-----------箭头绘制----------------------------
    _arrowPaint
      ..style = PaintingStyle.fill
      ..color = _progress.color;
    canvas.translate(_radius, _radius);
    canvas.rotate((_progress.value * 288 - angle + 76) / 180 * pi);
    var half = _radius - _progress.strokeWidth * 1.5 - 14;
    var eg = _radius / 50; //单位长
    _arrowPath.moveTo(0, -half - eg * 2);//移动到某一点
    _arrowPath.relativeLineTo(eg * 3, eg * 6);//纵坐标 和横坐标 同时移动距离
    _arrowPath.lineTo(0, -half + eg * 4);//连线

    _arrowPath.lineTo(0, -half - eg * 2);
    _arrowPath.relativeLineTo(-eg * 3, eg * 6);
    _arrowPath.lineTo(0, -half + eg * 4);
    canvas.drawPath(_arrowPath, _arrowPaint);
    canvas.restore();
    canvas.save();
    //------------箭头绘制---------------------------
    //-----------小圆点----------------------------
    _circlePaint
      ..style = PaintingStyle.stroke
      ..color = _progress.color
      ..strokeWidth = _progress.strokeWidth / 3 + 2;
    canvas.translate(_radius, _radius);
    canvas.rotate((_progress.value * 288 + 86) / 180 * pi);
    var halfCircle = _radius - _progress.strokeWidth * 1.5 + 3 - 8;
    //用Rect构建一个边长50,中心点坐标为100,100的矩形
    Rect rectC = Rect.fromCircle(
        center: Offset(halfCircle - _progress.strokeWidth * 2,
            halfCircle - _progress.strokeWidth * 2),
        radius: _progress.strokeWidth * 2 / 3);
    //根据上面的矩形,构建一个圆角矩形
    RRect rRect = RRect.fromRectAndRadius(rectC, Radius.circular(30.0));
    canvas.drawRRect(rRect, _circlePaint);

    canvas.restore();
    //------------小圆点---------------------------
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
