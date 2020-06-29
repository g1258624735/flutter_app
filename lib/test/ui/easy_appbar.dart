import 'package:flutter/material.dart';

class EasyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Color backGroundColor;

  final String title;

  final Function leftCallBack;
  final String leftTitle;
  final String leftImageName;

  final Function rightCallBack;
  final String rightTitle;
  final String rightImageName;

  final bool isHiddenLeftBtn; //true 左边不显示任何按钮  默认false

  final Widget titleWidget; //传入这个将替换标题默认的Text

  final List<Widget> rightWidgets;

  final TextStyle rightTitleStyle;

  final TextStyle leftTitleStyle;

  final TextStyle titleStyle;

  final bool isDark;

  EasyAppBar({Key key,
    this.backGroundColor = Colors.white,
    this.title,
    this.leftCallBack,
    this.leftTitle,
    this.leftImageName,
    this.rightCallBack,
    this.rightTitle,
    this.rightImageName,
    this.isHiddenLeftBtn = false,
    this.titleWidget,
    this.rightTitleStyle,
    this.leftTitleStyle,
    this.titleStyle = const TextStyle(color: Colors.black, fontSize: 16),
    this.rightWidgets,
    this.isDark = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      //标题 start
      title: Text(
        title, style: titleStyle,
      )
      ,
      //标题 end
      backgroundColor: backGroundColor,
      //左边按钮 start
      leading: isHiddenLeftBtn
          ? SizedBox()
          : leftImageName == null && leftTitle == null
          ? GestureDetector(
        child: Container(
          height: 10,
          width: 10,
          padding: EdgeInsets.all(10),
          child: Image.asset("assets/image/img.png",height: 10,width: 10),
        ),
        onTap: () {
          if (leftCallBack != null) {
            leftCallBack();
          } else {
            Navigator.pop(context);
          }
        },
      )
          : GestureDetector(
        child: Container(
          child: leftImageName == null
              ? Text(
            leftTitle,
            style: leftTitleStyle,
          )
              : AssetImage("assets/image/img.png"),
        ),
        onTap: () {
          if (leftCallBack != null) {
            leftCallBack();
          } else {
            Navigator.pop(context);
          }
        },
      ),
      //左边按钮 end

      //右边按钮 start
      actions: <Widget>[
        rightWidgets == null
            ? rightImageName == null && rightTitle == null
            ? SizedBox()
            : GestureDetector(
          child: Container(
              padding: EdgeInsets.only(right: 10),
              child: rightImageName == null
                  ? Text(
                rightTitle,
                style: rightTitleStyle,
              )
                  : AssetImage("assets/image/img.png"),
          ),
          onTap: () {
            if (rightCallBack != null) {
              rightCallBack();
            }
          },
        )
            : rightWidgets
        //右边按钮 end
      ],
      brightness: isDark ? Brightness.light : Brightness.dark,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(64);
}
