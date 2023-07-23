import 'package:flutter/material.dart';

import '../view_model/dog_controller.dart';

///  AnimatedBuilder的animation属性可以监听Listenable类，
///  自定义controller类继承ChangeNotifier类
///  可以简单实现局部刷新的功能
class Dog extends StatefulWidget {
  Dog({super.key, required this.controller});

  DogController controller;

  @override
  State<Dog> createState() => _DogState();
}

class _DogState extends State<Dog> {
  double get _sliderValue => widget.controller.value;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red.withOpacity(0.5),
      child: AnimatedBuilder(
        animation: widget.controller,
        builder: (BuildContext context, Widget? child) {
          return Column(
            children: [
              FlutterLogo(
                size: _sliderValue * 100 + 50,
              ),
              Slider(
                value: _sliderValue,
                onChanged: (value) {
                  setState(() {
                    widget.controller.value = value;
                  });
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
