import 'package:flutter/material.dart';
import 'dart:math';

///半圆形进度条 带小三角形指示器
///author gxj
///date 2020.4.21
class HalfCircleProgressWidget extends StatefulWidget {
  final HalfProgress progress;

  HalfCircleProgressWidget({Key key, this.progress}) : super(key: key);

  @override
  _HalfCircleProgressWidgetState createState() =>
      _HalfCircleProgressWidgetState();
}

///信息描述类 [value]为进度，在0~1之间,进度条颜色[color]，
///未完成的颜色[backgroundColor],圆的半径[radius],线宽[strokeWidth]
///小点的个数[dotCount] 样式[style] 完成后的显示文字[completeText]
class HalfProgress {
  double value;
  Color color;
  Color backgroundColor;
  double radius;
  double strokeWidth;
  int dotCount;
  TextStyle style;
  String completeText;

  HalfProgress(
      {this.value,
      this.color,
      this.backgroundColor,
      this.radius,
      this.strokeWidth,
      this.completeText = "100%",
      this.style,
      this.dotCount = 40});
}

class _HalfCircleProgressWidgetState extends State<HalfCircleProgressWidget> {
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
  HalfProgress _progress;
  Paint _paint;
  Paint _arrowPaint;
  Path _arrowPath;
  double _radius;

  ProgressPainter(this._progress) {
    _arrowPath = Path();
    _arrowPaint = Paint();
    _paint = Paint();

    ///注意 圆形的真正半径应该是 圆的一半减去 圆弧边框的一半。
    _radius = _progress.radius - _progress.strokeWidth / 2;
  }

  @override
  void paint(Canvas canvas, Size size) {
    //画布准备 [0,0] ->[size,size] 画布矩形框大小
    Rect rect = Offset.zero & size;
    canvas.clipRect(rect); //裁剪区域
    // 平移 需要平移圆弧边框一半的距离
    canvas.translate(_progress.strokeWidth / 2, _progress.strokeWidth / 2);
    canvas.save();

    //起始点旋转的角度
    int startAngle = -225; // 开始绘制的角度。

    //----------- 最外层圆形进度绘制-------------------start
    _paint
      ..style = PaintingStyle.stroke // 线条 是实心还是 空心
      ..color = _progress.backgroundColor // 线条颜色
      ..isAntiAlias = true //是否启动抗锯齿
      ..strokeWidth = _progress.strokeWidth // 线条宽度 圆环绘制是以圆心到 线条中心为半径。
      ..strokeCap = StrokeCap.round; //线条起始点的形状  可为圆形和方形。
    int degree = 360 - 90; // 只需要绘制四分之三圆角
    double sweepAngle = _progress.value * degree; //完成角度
    // 绘制完整圆弧
    canvas.drawArc(Rect.fromLTRB(0, 0, _radius * 2, _radius * 2),
        startAngle / 180 * pi, degree / 180 * pi, false, _paint);
    canvas.restore();
    canvas.save();
    //----------- 最外层圆形进度绘制-------------------end

    //----------- 绘制圆弧进度 -----------------------start
    _paint..color = _progress.color;
    //根据传入百分比  绘制相应圆弧
    canvas.drawArc(Rect.fromLTRB(0, 0, _radius * 2, _radius * 2),
        startAngle / 180 * pi, (sweepAngle) / 180 * pi, false, _paint);
    canvas.restore();
    canvas.save();
    //----------- 绘制圆弧进度------------------------end

    //-----------箭头绘制-----------------------------start
    _arrowPaint
      ..style = PaintingStyle.fill
      ..color = _progress.color;
    canvas.translate(_radius, _radius);
    canvas.rotate((-startAngle + _progress.value * degree) / 180 * pi);
    var half = _radius - _progress.strokeWidth;
    var eg = _radius / 50; //单位长
    _arrowPath.moveTo(0, -half - eg * 2); //移动到某一点
    _arrowPath.relativeLineTo(eg * 3, eg * 6); //纵坐标 和横坐标 同时移动距离
    _arrowPath.lineTo(0, -half + eg * 4); //连线

    _arrowPath.lineTo(0, -half - eg * 2);
    _arrowPath.relativeLineTo(-eg * 3, eg * 6);
    _arrowPath.lineTo(0, -half + eg * 4);
    canvas.drawPath(_arrowPath, _arrowPaint);
    canvas.restore();
//    canvas.save();// 将要进行下一个图绘制时候需要调用保存
    //------------箭头绘制--------------------------- end
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
