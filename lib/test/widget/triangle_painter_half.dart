import 'package:flutter/material.dart';
 
 
 /// 绘制三角形
class TrianglePainterHalf extends CustomPainter {

  Color color; //填充颜色
  Paint _paint; //画笔
  Path _path; //绘制路径
  double angle; //角度

  TrianglePainterHalf(this.color) {
    _paint = Paint()
      ..strokeWidth = 1.0 //线宽
      ..color = color
      ..isAntiAlias = true;
    _path = Path();
  }

  @override
  void paint(Canvas canvas, Size size) {
    final baseX = size.width * 0.5;
    final baseY = size.height * 0.5;
    //起点
    _path.moveTo(0,0);
    _path.lineTo(0,2*baseY);
    _path.lineTo(2*baseX, 0);
    canvas.drawPath(_path, _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
 
