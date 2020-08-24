import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 倒计时显示
class HandOrderLoadingWidget extends StatefulWidget {
  final Function callback;

  @override
  State<StatefulWidget> createState() {
    return _HandOrderLoadingWidgetState();
  }

  HandOrderLoadingWidget({
    this.callback,
  });
}

class _HandOrderLoadingWidgetState extends State<HandOrderLoadingWidget> {
  Timer _countdownTimer;
  int _countdownNum = 10;

  @override
  void initState() {
    super.initState();
    if(widget.callback!=null){
      widget.callback("start");
    }
    startCountdown();
  }

  @override
  Widget build(BuildContext context) {
    return new Material(
        type: MaterialType.transparency, //透明类型
        child: new Container(
            width: double.infinity,
            height: 98,
            alignment: Alignment.center,
            child: Container(
              width: 150,
              height: 98,
              alignment: Alignment.center,
              decoration: ShapeDecoration(
                color: Color(0xb3000000),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8.0),
                  ),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.only(bottom: 12),
                      child: Stack(
                        alignment: Alignment.center,
                        children: <Widget>[
                          Container(
                              width: 30,
                              height: 30,
                              child: CircularProgressIndicator(
                                strokeWidth: 3,
                                backgroundColor: Color(0x33000000),
                                valueColor: new AlwaysStoppedAnimation<Color>(
                                    Colors.white70),
                              )),
                          Text(
                            "${_countdownNum}s",
                            style: TextStyle(
                                fontSize: 12, color: Color(0xffffffff)),
                          )
                        ],
                      )),
                  Text(
                    "订单提交中...",
                    style: TextStyle(color: Color(0xffffffff), fontSize: 16),
                  )
                ],
              ),
            )));
  }

  void startCountdown() {
    setState(() {
      if (_countdownTimer != null) {
        return;
      }
      _countdownTimer = new Timer.periodic(new Duration(seconds: 1), (timer) {
        setState(() {
          if (_countdownNum == 0) {
            _countdownTimer?.cancel();
            _countdownTimer = null;
            if (widget.callback != null) {
              //倒计时结束回调
              widget.callback("end");
            }
          }else{
            _countdownNum--;
          }
        });
      });
    });
  }

  @override
  void dispose() {
    _countdownTimer?.cancel();
    _countdownTimer = null;
    super.dispose();
  }
}
