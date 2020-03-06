import 'dart:async';

import 'package:flutter/material.dart';

class Test3App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new ShoppingListWidget(
      products: [
        new Product(name: "商品1-点我删除"),
        new Product(name: "商品2--点我删除"),
        new Product(name: "商品3-点我删除"),
        new Product(name: "商品3-点我删除"),
        new Product(name: "商品3-点我删除"),
        new Product(name: "商品3-点我删除"),
        new Product(name: "商品3-点我删除"),
        new Product(name: "商品3-点我删除"),
        new Product(name: "商品3-点我删除"),
        new Product(name: "商品3-点我删除"),
        new Product(name: "商品3-点我删除"),
        new Product(name: "商品3-点我删除"),
        new Product(name: "商品3-点我删除"),
        new Product(name: "商品3-点我删除"),
        new Product(name: "商品3-点我删除"),
        new Product(name: "商品3-点我删除"),
        new Product(name: "商品3-点我删除"),
        new Product(name: "商品3-点我删除"),
      ],
    );
  }
}

/// 数据模型
class Product {
  const Product({this.name});

  final String name;
}

/// 回调接口   在 dart 里面 函数也是一个对象 。
/// 类似于下面的例子  typedef 只是标记这个是一个函数类型 并不会关注函数具体名称是什么 只会关注函数所传的参数和返回值 。
//typedef Predicate<E> = bool Function(E element);
typedef void CartChangedCallback(Product product, bool inCart);

/// 列表 item;
class ShoppingListItem extends StatelessWidget {
  final Product product;
  final bool inCart;
  final CartChangedCallback onCartChanged;

  ShoppingListItem({
    Product product,
    this.inCart,
    this.onCartChanged,
  })  : product = product,
        super(key: new ObjectKey(product));

  Color _getColor(BuildContext context) {
    return inCart ? Colors.black54 : Theme.of(context).primaryColor;
  }

  TextStyle _getTextStyle(BuildContext context) {
    if (!inCart) return null;
    return new TextStyle(
      color: Colors.black54,
      decoration: TextDecoration.lineThrough,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new ListTile(
      onTap: () {
        onCartChanged(product, !inCart);
      },
      leading: new CircleAvatar(
        backgroundColor: _getColor(context),
        child: new Text(product.name[0]),
      ),
      title: new Text(
        product.name,
        style: _getTextStyle(context),
      ),
    );
  }
}
final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
GlobalKey<RefreshIndicatorState>();
class ShoppingListWidget extends StatefulWidget {
  ///如果没有key，当前构建中的第一个条目将始终与前一个构建中的第一个条目同步，即使在语义上，列表中的第一个条目如果滚动出屏幕，那么它将不会再在窗口中可见。
  ///通过给列表中的每个条目分配为“语义” key，无限列表可以更高效，
  /// 因为框架将同步条目与匹配的语义key并因此具有相似（或相同）的可视外观。
  /// 此外，语义上同步条目意味着在有状态子widget中，
  ///保留的状态将附加到相同的语义条目上，而不是附加到相同数字位置上的条目。
  ShoppingListWidget({Key key, this.products}) : super(key: key);
  final List<Product> products;


  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _ShoppingListState();
  }
}

class _ShoppingListState extends State<ShoppingListWidget> {
  Set<Product> _shoppingCart = new Set<Product>();

  void _handleCartChanged(Product product, bool inCart) {
    setState(() {
      if (inCart) {
        _shoppingCart.add(product);
      } else {
        _shoppingCart.remove(product);
      }
    });
  }

  //异步
  Future<void> _handleRefresh() {
    Completer<void> completer = Completer<void>();
    Timer(const Duration(seconds: 1), () {
      completer.complete();
    });
    return completer.future.then<void>((_){
      _refreshIndicatorKey.currentState.dispose();
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("购物车"),
        ),
        body: RefreshIndicator(
            child: new ListView(
              padding: new EdgeInsets.symmetric(vertical: 8.0),
              children: widget.products.map((Product product) {
                return new ShoppingListItem(
                    product: product,
                    inCart: _shoppingCart.contains(product),
                    onCartChanged: _handleCartChanged);
              }).toList(),
            ),
            onRefresh: _handleRefresh));
  }
}
