import 'package:flutter/material.dart';

class Love2Widget extends StatefulWidget {
  final LoveProgress progress;

  Love2Widget({Key key, this.progress}) : super(key: key);

  @override
  _Love2WidgetState createState() => _Love2WidgetState();
}

///信息描述类 [value]为进度，在0~1之间,进度条颜色[color]，
///未完成的颜色[backgroundColor],圆的半径[radius],线宽[strokeWidth]
///小点的个数[dotCount] 样式[style] 完成后的显示文字[completeText]
class LoveProgress {
  double value;
  Color color;
  Color backgroundColor;
  double radius;
  double strokeWidth;
  int dotCount;
  TextStyle style;

  LoveProgress(
      {this.value,
      this.color,
      this.backgroundColor,
      this.radius,
      this.strokeWidth,
      this.dotCount = 40});
}

class _Love2WidgetState extends State<Love2Widget> {
  @override
  Widget build(BuildContext context) {
    var progress = Container(
      width: widget.progress.radius * 2,
      height: widget.progress.radius * 2,
      child: CustomPaint(
        painter: ProgressPainter(widget.progress),
      ),
    );
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[progress],
    );
  }
}

class ProgressPainter extends CustomPainter {
  LoveProgress _progress;
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

    //----------- 最外层圆形进度绘制-------------------start
    _paint
      ..style = PaintingStyle.stroke // 线条 是实心还是 空心
      ..color = _progress.backgroundColor // 线条颜色
      ..isAntiAlias = true //是否启动抗锯齿
      ..strokeWidth = _progress.strokeWidth // 线条宽度 圆环绘制是以圆心到 线条中心为半径。
      ..strokeCap = StrokeCap.square; //线条起始点的形状  可为圆形和方形。
    //-----------箭头绘制-----------------------------start
    canvas.translate(_radius, _radius);
//    canvas.rotate((-startAngle + _progress.value * degree) / 180 * pi);
    _arrowPath.moveTo(0, 12); //移动到某一点
    _arrowPath.relativeLineTo(-10, -20); //纵坐标 和横坐标 同时移动距离(相对移动)
    _arrowPath.cubicTo(-10,-8,-5,-13,0,-8);//三阶贝塞尔曲线
    _arrowPath.cubicTo(0,-8,5,-13,10,-8);
    _arrowPath.cubicTo(10,-8,5,-13,10,-8);
//    _arrowPath.lineTo(0,-8);
//    _arrowPath.relativeLineTo(-eg * 3, eg * 6);
//    _arrowPath.lineTo(0, eg * 4);
    canvas.drawPath(_arrowPath, _paint);
    canvas.restore();
//    canvas.save();// 将要进行下一个图绘制时候需要调用保存
    //------------箭头绘制--------------------------- end
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
