import 'package:flutter/material.dart';

class Pig extends StatelessWidget {
  const Pig({super.key});

  @override
  Widget build(BuildContext context) {
    print('Pig rebuild');

    /// 寻找最近的MyColor InheritedWidget, 这个有依赖，如果MyColor变化回监听到
    // final myColor = context.dependOnInheritedWidgetOfExactType<MyColor>();

    /// 寻找最近的MyColor InheritedWidget, 无依赖
    // final getMyColor = context.getInheritedWidgetOfExactType<MyColor>();

    return Container(
      width: 100,
      height: 100,
      // color: myColor?.color,

      color: MyColor.maybeOf(context)?.color,
    );
  }
}

class MyColor extends InheritedWidget {
  const MyColor({super.key, required super.child, required this.color});

  final Color color;

  static MyColor? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<MyColor>();
  }

  static MyColor of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<MyColor>()!;
  }

  @override
  bool updateShouldNotify(covariant MyColor oldWidget) {
    return oldWidget.color != color;
  }
}
