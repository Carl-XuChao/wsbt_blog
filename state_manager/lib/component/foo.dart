import 'package:flutter/material.dart';

/// 2. 子组件访问外部变量： 传参
///    子组件修改外部变量： 传函数回调修改状态值
class Foo extends StatelessWidget {
  const Foo({super.key, required this.counter, required this.add});

  final int counter;

  // final VoidCallback onPressed;

  final Function(int) add;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.red.withOpacity(0.5),
      margin: const EdgeInsets.all(16),
      child: Column(
        children: [
          const Center(child: FlutterLogo(size: 50)),
          Text(
            '$counter',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          ElevatedButton(
            onPressed: () => add(2),
            child: Text('+2'),
          ),
        ],
      ),
    );
  }
}
