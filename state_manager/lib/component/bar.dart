import 'package:flutter/material.dart';

/// 1. 状态提升： 把子控件的状态上升到父控件，进行修改刷新
class Bar extends StatelessWidget {
  const Bar({super.key});

  @override
  Widget build(BuildContext context) {
    print("Bar Build");
    return FlutterLogo(size: 80);
  }
}
