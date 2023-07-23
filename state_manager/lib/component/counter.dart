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
        widget.controller.count++;
      },
      child: ListenableBuilder(
        listenable: widget.controller,
        builder: (context, child) {
          print("ListenableBuilder rebuild");
          return Text(
            'Counter:  ${widget.controller.count}',
            style: const TextStyle(fontSize: 48),
          );
        }
      ),
    );
  }
}

class CounterController extends ChangeNotifier {
  int _count = 0;

  int get count => _count;

  set count(int newValue) {
    _count = newValue;
    notifyListeners();
  }

  void reset() {
    count = 0;
  }
}
