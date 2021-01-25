import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:flutter_plugin_qrcode/flutter_plugin_qrcode.dart';
import 'package:permission_handler/permission_handler.dart';

///测试 二维码扫描
class ScanPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ScanPageState();
  }
}

class _ScanPageState extends State<ScanPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "二维码扫描",
          style: TextStyle(color: Colors.white),
        ),
        leading: _buildLeading(),
        elevation: 0,
        backgroundColor: Color(0xffF43333),
      ),
      body: Center(
          child: RaisedButton(
        onPressed: () {
          scan();
        },
        child: Text("开启扫码"),
      )),
    );
  }

  ///扫码函数,最简单的那种
  Future scan() async {
    final isGrantedCamera = await Permission.camera.isGranted;
    final isGrantedStorage = await Permission.storage.isGranted;
    if (isGrantedCamera && isGrantedStorage) {
      String qrcode;
      try {
        // qrcode = await FlutterPluginQrcode.getQRCode;
      } on PlatformException {
        qrcode = 'Failed to get platform version.';
      }

      print("二维码扫描结果:" + qrcode); //在控制台打印
    } else {
      Map<Permission, PermissionStatus> statuses = await [
        Permission.camera,
        Permission.storage,
      ].request();
      if (statuses[Permission.camera].isGranted &&
          statuses[Permission.storage].isGranted) {
        print("权限获取成功"); //在控制台打印
        scan();
      }
    }
  }

  ///返回按钮
  Widget _buildLeading() => IconButton(
        icon: Image.asset("assets/image/back_white.png"),
        padding: EdgeInsets.all(12),
        onPressed: () => Navigator.of(context).pop(),
      );
}
