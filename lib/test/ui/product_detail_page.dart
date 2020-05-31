import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class ProductDetailPage extends StatefulWidget {
  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  List<String> _imageList = [
    'https://osscdn.perfect99.com/perfect-mall-1/prod/home/a6DHpsYGYb.png?x-oss-process=image/resize,w_220',
    'https://osscdn.perfect99.com/perfect-mall-1/prod/home/cmMeKaKRkC.png?x-oss-process=image/resize,w_220'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          color: Colors.amber,
      child:_getContainer() ,
    ));
  }

  Widget _getContainer(){
    return ListView( padding:EdgeInsets.only(top: 0),children: <Widget>[Container(height: 200,width: MediaQuery.of(context).size.width,color: Colors.blueAccent,)],);
  }
Widget _getItem(){
 return ListView(
    children: <Widget>[
      Stack(
        children: <Widget>[
          Container(
              color: Colors.red,
              height: 375,
              child: Swiper(
                scrollDirection: Axis.horizontal,
                // 横向
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage("${_imageList[index]}"),
                              fit: BoxFit.fill,
                            )),
                      ));
                },
                loop: true,
                itemCount: _imageList.length,
                autoplay: true,
                pagination: SwiperPagination(),
                viewportFraction: 1,
                // 当前视窗展示比例 小于1可见上一个和下一个视窗
                // 两张图片之间的间隔
              )),
          Positioned(
            left: 15,
            child: Container(
              alignment: Alignment.center,
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                  color: hexToColor("#8a9394"),
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              child: Text(
                '<',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
          Positioned(
            right: 13,
            child: Container(
              alignment: Alignment.center,
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                  color: hexToColor("#8a9394"),
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              child: Icon(
                Icons.share,
                size: 18,
                color: Colors.white,
              ),
            ),
          ),
          Positioned(
            right: 53,
            child: Container(
              alignment: Alignment.center,
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                  color: hexToColor("#8a9394"),
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              child: Icon(
                Icons.home,
                size: 18,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      Container(
        padding: EdgeInsets.only(left: 15, top: 6),
        color: hexToColor('#FFF4D6'),
        height: 28.5,
        child: Text(
          '下单即可获得 2300 积分(pv)，用于购物抵现',
          style: TextStyle(color: hexToColor('#532F12'), fontSize: 12),
        ),
      ),
      Container(
        color: Colors.white,
        height: 60,
        child: Row(
          children: <Widget>[
            SizedBox(
              width: 15.5,
            ),
            RichText(
              text: TextSpan(
                text: '¥',
                style:
                TextStyle(color: hexToColor('#C81C3A'), fontSize: 15.0),
                children: <TextSpan>[
                  TextSpan(
                    text: '624 ',
                    style: TextStyle(
                        color: hexToColor('#DF1538'), fontSize: 25.0),
                  ),
                  TextSpan(
                      text: '¥800',
                      style: TextStyle(
                          decoration: TextDecoration.lineThrough,
                          decorationColor: hexToColor("#999999"),
                          color: hexToColor("#999999"),
                          fontSize: 15))
                ],
              ),
            ),
            Expanded(
              child: SizedBox(),
            ),
            Container(
              margin: EdgeInsets.only(right: 2.75),
              alignment: Alignment.center,
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                  color: hexToColor("#67B83C"),
                  borderRadius: BorderRadius.all(Radius.circular(12))),
              child: Icon(
                Icons.share,
                size: 13,
                color: Colors.white,
              ),
            ),
            Text(
              '推荐分享',
              style: TextStyle(
                  color: hexToColor(
                    '#532F12',
                  ),
                  fontSize: 12),
            ),
            SizedBox(
              width: 15,
            )
          ],
        ),
      )
    ],
  );
}
  Color hexToColor(String s) {
    // 如果传入的十六进制颜色值不符合要求，返回默认值
    if (s == null ||
        s.length != 7 ||
        int.tryParse(s.substring(1, 7), radix: 16) == null) {
      s = '#999999';
    }

    return new Color(int.parse(s.substring(1, 7), radix: 16) + 0xFF000000);
  }
}
