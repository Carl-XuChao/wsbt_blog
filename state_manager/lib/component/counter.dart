import 'package:flutter/material.dart';

class Counter extends StatefulWidget {
  const Counter({super.key, required this.controller});

  final CounterController controller;

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  @override
  Widget build(BuildContext context) {
    print("Counter rebuild");
    return ElevatedButton(
      onPressed: () {
        widget.controller.count.value++;
        widget.controller.fontSize.value++;
      },
      child: ListenableBuilder(
          listenable: Listenable.merge([
            widget.controller.count,
            widget.controller.fontSize,
          ]),
          builder: (context, child) {
            print("ListenableBuilder rebuild");
            return Text(
              'Counter:  ${widget.controller.count.value}',
              style: TextStyle(fontSize: widget.controller.fontSize.value),
            );
          }),
    );
  }
}

class CounterController {
  ValueNotifier<int> count = ValueNotifier(0);

  ValueNotifier<double> fontSize = ValueNotifier(18);
}
