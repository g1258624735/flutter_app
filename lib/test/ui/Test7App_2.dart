//import 'package:fluttertoast/fluttertoast.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//测试控件 7_2
class Test7App_2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Test7App_2_1();
  }
}

class _Test7App_2_1 extends State {
  @override
  void initState() {
    super.initState();
  }

  bool _checkBox_1 = true;
  bool _checkBox_2 = true;
  double _seek_position_1 = 0;
  RangeValues _discreteCustomValues = const RangeValues(40.0, 100.0);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Align(
      child: new Column(
        children: <Widget>[
          Text("第一个控件"),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Checkbox(
                  tristate: true,
                  onChanged: (bool value) {
                    setState(() {
                      _checkBox_1 = value;
                    });
                  },
                  value: _checkBox_1),
              Checkbox(
                  onChanged: (bool value) {
                    setState(() {
                      _checkBox_2 = value;
                    });
                  },
                  value: _checkBox_2),
            ],
          ),
          Slider.adaptive(
              value: _seek_position_1,
              min: 0,
              max: 100,
              divisions: 20,
              label: '${_seek_position_1.round()}',
              onChanged: (double value) {
                setState(() {
                  _seek_position_1 = value;
                });
              }),
          RangeSlider(
            values: _discreteCustomValues,
            divisions: 10,
            min: 0,
            max: 100,
            onChanged: (values) {
              setState(() {
                _discreteCustomValues = values;
              });
            },
            labels: RangeLabels('${_discreteCustomValues.start.round()}',
                '${_discreteCustomValues.end.round()}'),
          ),
          Align(
              alignment: Alignment.center,
              //宽度因子  代表 Align 宽度是 子类* 宽度因子
              widthFactor: 1,
              //高度因子  代表 Align 高度是 子类* 高度因子
              heightFactor: 2,
              child: OutlineButton(
                child: Text("ios风格dialog"),
                onPressed: () {
//        showCupertinoDialog(context: context, builder: null);
                },
              ))
        ],
      ),
    );
  }
}
