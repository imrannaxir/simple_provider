import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'counter.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    Counter counter = Provider.of<Counter>(context, listen: false);
    return Scaffold(
        appBar: AppBar(
          title: Text(
            widget.title,
          ),
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          centerTitle: true,
        ),
        body: myHomePage(),
        floatingActionButton: myFloatingActionButton(counter));
  }

  Widget myHomePage() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Consumer<Counter>(
            builder: (context, value, child) => Text(
              '${value.count}',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
        ],
      ),
    );
  }

  Widget myFloatingActionButton(counter) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        FloatingActionButton(
          onPressed: () {
            counter.increment();
          },
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
        SizedBox(width: 10),
        FloatingActionButton(
          onPressed: () {
            counter.decrement();
          },
          tooltip: 'Decrement',
          child: const Icon(
            Icons.remove,
          ),
        ),
      ],
    );
  }
}
