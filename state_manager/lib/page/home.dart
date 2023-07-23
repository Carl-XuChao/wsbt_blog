import 'package:flutter/material.dart';
import 'package:state_manager/component/dog.dart';
import 'package:state_manager/component/pig.dart';

import '../component/bar.dart';
import '../component/counter.dart';
import '../component/foo.dart';
import '../component/Scale_slider.dart';
import '../view_model/dog_controller.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  int _counter = 0;

  final _dh = DoubleHolder(0);

  final _dogController = DogController();

  final _counterController = CounterController();

  late final _controller = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 2),
  )..repeat();

  Color _childThemeColor = Colors.blue;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _add(int value) {
    setState(() {
      _counter += value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MyColor(
      color: _childThemeColor,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        // body: AnimatedBuilder(
        //   animation: _controller,
        //   builder: (BuildContext context, Widget? child) => Center(
        //     child: content,
        //   ),
        // ),
        body: Center(
          child: content,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              _childThemeColor = Colors.black;
            });
          },
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }

  Widget get content => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('You have pushed the button this many times:'),

          // bar,

          // ...foo,

          // ...scaleSlider,

          // ...dog,

          // ...counter,

          pig,
        ],
      );

  Widget get bar => const Bar();

  List<Widget> get foo => [
        Text(
          '$_counter',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const Bar(),
        Foo(
          counter: _counter,
          add: _add,
        ),
      ];

  List<Widget> get scaleSlider => [
        ScaledSlider(
          hb: _dh,
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {
              _dh.value = 1;
            });
          },
          child: const Text('set to 100%'),
        ),
      ];

  List<Widget> get dog => [
        Dog(controller: _dogController),
        ElevatedButton(
          onPressed: () {
            _dogController.value = 1;
          },
          child: const Text('set to 100%'),
        ),
      ];

  List<Widget> get counter => [
        Counter(controller: _counterController),
        ElevatedButton(
          onPressed: () {
            _counterController.count.value = 0;
            _counterController.fontSize.value = 18;
          },
          child: const Text('clear'),
        ),
      ];

  Widget get pig => const Pig();
}

class DoubleHolder {
  double value;

  DoubleHolder(this.value);
}
