import 'package:flutter/material.dart';

import '../page/home.dart';

/// 定义对象类属性，地址引用
class Per extends StatefulWidget {
  Per({super.key, required this.hb});

  DoubleHolder hb;

  @override
  State<Per> createState() => _PerState();
}

class _PerState extends State<Per> {


  double get _sliderValue => widget.hb.value;


  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red.withOpacity(0.5),
      child: Column(
        children: [
          FlutterLogo(
            size: _sliderValue * 100 + 50,
          ),
          Slider(
            value: _sliderValue,
            onChanged: (value) {
              setState(() {
                widget.hb.value = value;
              });
            },
          ),
        ],
      ),
    );
  }
}
