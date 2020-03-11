
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

///详情界面

class DetailInfoPage extends StatefulWidget {
  final String title;
  final String url;

  DetailInfoPage({Key key, @required this.title, @required this.url})
      : super(key: key);

  @override
  _DetailInfoPageState createState() => new _DetailInfoPageState();
}

class _DetailInfoPageState extends State<DetailInfoPage> {
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
