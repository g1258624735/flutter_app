import 'package:flutter/material.dart';
import 'package:flutter_app/zhihu_demo/util/StringUtils.dart';

import 'ArticleDetailWebPage.dart';

//我的界面
class ArticleItem extends StatefulWidget {
  var itemData;
  bool isSearch=false;
  String id;

  ArticleItem(var itemData) {
    this.itemData = itemData;
  }

  ArticleItem.isSearch(var itemData, String id) {
    this.itemData = itemData;
    this.id = id;
  }

  @override
  _ArticleItemState createState() => new _ArticleItemState();
}

class _ArticleItemState extends State<ArticleItem> {
  @override
  Widget build(BuildContext context) {
    bool isCollect = widget.itemData["collect"];
    Row auther = Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Expanded(
          child: Row(
            children: <Widget>[
              Text("作者 "),
              Text(
                widget.itemData['author'],
                style: TextStyle(color: Theme
                    .of(context)
                    .accentColor),
              )
            ],
          ),
        )
        , Text(widget.itemData['niceDate'],
          style: TextStyle(color: Theme
              .of(context)
              .accentColor),)
      ],
    );
    Row title = Row(children: <Widget>[
      Expanded(child:
      Text.rich(widget.isSearch ?
      StringUtils.getTextSpan(widget.itemData['title'], widget.id) : TextSpan(
          text: widget.itemData['title']), softWrap: true,
        style: TextStyle(fontSize: 16, color: Colors.black),
        textAlign: TextAlign.left,))
    ]);
    Row chapterName = Row(
//      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Expanded(
          child: Text(
            widget.isSearch ? '' : widget.itemData['chapterName'],
            softWrap: true,
            style: TextStyle(color: Theme
                .of(context)
                .accentColor),
            textAlign: TextAlign.left,
          ),
        ),
        IconButton(
          icon: Icon(
            isCollect ? Icons.favorite : Icons.favorite_border,
            color: isCollect ? Colors.red : null,
          ),
          onPressed: () {
//            _handleOnItemCollect(widget.itemData);
          },
        )
      ],
    );

    Column column = Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
          child: auther,
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 0.0),
          child: title,
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
          child: chapterName,
        ),
      ],
    );

    return Card(
      elevation: 4.0,
      child: InkWell(
        child: column,
        onTap: () {
          _itemClick(widget.itemData);
        },
      ),
    );
  }
  void _itemClick(itemData) async {
    await Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return ArticleDetailWebPage(
        title: itemData['title'],
        url: itemData['link'],
      );
    }));
  }
}
