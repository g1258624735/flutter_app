import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

///订单提交失效弹窗
// ignore: must_be_immutable
class PayNewOrderLoseDialog extends StatefulWidget {
  List list;

  PayNewOrderLoseDialog({
    Key key,
    this.list,
  }) : super(key: key);

  @override
  PayNewOrderLoseDialogState createState() => PayNewOrderLoseDialogState();
}

class PayNewOrderLoseDialogState extends State<PayNewOrderLoseDialog> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.list != null) {
      widget.list.clear();
      widget.list.add("");
    } else {
      widget.list = List();
      widget.list.add("");
    }
    double height = 130.0 +
        (widget.list == null
            ? 0
            : 76.0 * (widget.list.length > 5 ? 5 : widget.list.length));
    return new Material(
        type: MaterialType.transparency, //透明类型
        child: Container(
            width: double.infinity,
            alignment: Alignment.center,
            child: Container(
                width: 270,
                height: height,
                alignment: Alignment.topCenter,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8.0),
                    ),
                  ),
                ),
                child: Padding(
                  padding:
                      EdgeInsets.only(top: 20, left: 12, right: 12, bottom: 4),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "抱歉，您本单购买的以下商品在所选择的地址下暂时无货或商品失效",
                        style:
                            TextStyle(color: Color(0xff060918), fontSize: 16),
                      ),
                      Expanded(
                          child: ListView.builder(
                        padding: EdgeInsets.only(top: 0),
                        itemBuilder: (context, index) {
                          return Column(children: <Widget>[
                            _getItem(),
                            SizedBox(
                              height: 8,
                            )
                          ]);
                        },
                        itemCount: widget.list == null ? 0 : widget.list.length,
                      )),
                      Container(
                        color: Color(0xfff1f1f1),
                        height: 1,
                        width: double.infinity,
                      ),
                      Container(
                          height: 52,
                          width: double.infinity,
                          alignment: Alignment.bottomCenter,
                          child: _getBottomButton(context))
                    ],
                  ),
                ))));
  }

  /// 获取底部按钮布局
  Widget _getBottomButton(BuildContext context) {
    Widget raisedButton;
    raisedButton = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Expanded(
            child: _getOutButton(context, "取消", onPressed: () {
          Navigator.of(context).pop();
        })),
        SizedBox(
          width: 10,
        ),
        Expanded(
            child: _getRaisedButton(context, "确定", onPressed: () {
          Navigator.of(context).pop();
        }))
      ],
    );
    return raisedButton;
  }

  Widget _getRaisedButton(BuildContext context, String buttonText,
      {Null Function() onPressed}) {
    return RaisedButton(
        elevation: 0.0,
        color: Color(0xffF43333),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0))),
        child: Text(buttonText,
            style: TextStyle(fontSize: 16, color: Colors.white)),
        onPressed: onPressed);
  }

  Widget _getOutButton(BuildContext context, String buttonText,
      {Null Function() onPressed}) {
    return OutlineButton(
        color: Colors.white,
        borderSide: new BorderSide(color: Color(0xffF43333)),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0))),
        highlightedBorderColor: Color(0xffF43333),
        child: Text(buttonText,
            style: TextStyle(fontSize: 16, color: Color(0xffF43333))),
        onPressed: onPressed);
  }

  Widget _getItem() {
    return Container(
        height: 68,
        decoration: ShapeDecoration(
          color: Color(0xffF8F7FA),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(8.0),
            ),
          ),
        ),
        child: Row(
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Container(
                  width: 68.0,
                  height: 68.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(""),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(4.0),
                    ),
                  ),
                ),
                Visibility(
                    visible: true,
                    child:
                        Stack(alignment: Alignment.center, children: <Widget>[
                      Container(
                        width: 68,
                        height: 68,
                        decoration: BoxDecoration(
                            color: Color(0x99ffffff),
                            borderRadius: BorderRadius.all(Radius.circular(4))),
                        alignment: Alignment.center,
                      ),
                      Container(
                        width: 42,
                        height: 42,
                        decoration: BoxDecoration(
                            color: Color(0x80000000),
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        alignment: Alignment.center,
                      ),
                      Container(
                          width: 36,
                          height: 36,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 0.5, color: Color(0xffffffff)),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(18)))),
                      Container(
                          width: 20,
                          child: Text(
                            "失效商品",
                            style: TextStyle(color: Colors.white, fontSize: 10),
                            softWrap: true,
                            maxLines: 2,
                          ))
                    ]))
              ],
            ),
            SizedBox(
              width: 12,
            ),
            Expanded(
              child: Container(
                  height: 68,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        child: Text(
                          "商品商品商品商品商品商品商品商品商品",
                          style: TextStyle(
                            color: Color(0xff5A5A66),
                            fontSize: 14,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        padding: EdgeInsets.only(top: 4),
                      ),
                      Spacer(),
                      Padding(
                        child: Text(
                          "x1",
                          style:
                              TextStyle(color: Color(0xff5A5A66), fontSize: 14),
                        ),
                        padding: EdgeInsets.only(bottom: 2),
                      )
                    ],
                  )),
            )
          ],
        ));
  }
}
