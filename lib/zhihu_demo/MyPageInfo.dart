
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

///详情界面

class MyPageInfo extends StatefulWidget {
  final String title;
  final String url;

  MyPageInfo({Key key, @required this.title, @required this.url})
      : super(key: key);

  @override
  _MyPageInfoState createState() => new _MyPageInfoState();
}

class _MyPageInfoState extends State<MyPageInfo> {
  final flutterWebViewPlugin = FlutterWebviewPlugin();

  @override
  void initState() {
    super.initState();
    flutterWebViewPlugin.onDestroy.listen((_) {
      Navigator.of(context).pop();
    });
  }

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
        url: widget.url,
        appBar: AppBar(title: Text(widget.title)),
        withZoom: false,
        withLocalStorage: true,
        withJavascript: true);
  }
}
