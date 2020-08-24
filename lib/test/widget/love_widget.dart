import 'package:flutter/material.dart';

class BottomClipper extends CustomClipper<Path> {

  @override
  Path getClip(Size size) {
    // 路径
    var path = Path();
    // 设置路径的开始点
    path.lineTo(0, 0);
    path.lineTo(0, size.height-50);

    // 设置第一个曲线的样式
    var firstControlPoint = Offset(size.width / 4, size.height);
    var firstEndPont = Offset(size.width / 2, size.height - 40);

    // 把设置好的第一个样式添加到路径里面
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPont.dx, firstEndPont.dy);

    // 设置第二个曲线的样式
    var secondConttrolPoint = Offset(size.width / 4 * 3, size.height - 70);
    var secondEndpoint = Offset(size.width, size.height - 40);

    // 把第二个设置好的样式添加到路径里面
    path.quadraticBezierTo(secondConttrolPoint.dx, secondConttrolPoint.dy,
        secondEndpoint.dx, secondEndpoint.dy);
    // 设置路径的结束点
    path.lineTo(size.width, size.height-40);
    path.lineTo(size.width, 0);
    // 返回路径
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}