import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_provider/student.dart';
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

    Student student = context.read<Student>();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
        ),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: true,
      ),
      body: myHomePage(),
      floatingActionButton: myFloatingActionButton(counter, student),
    );
  }

  Widget myHomePage() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Selector<Student, String>(
            selector: (context, student) => student.name,
            builder: (context, value, child) => Text(
              value,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
          Selector<Student, int>(
            selector: (context, student) => student.rollNo,
            builder: (context, value, child) => Text(
              value.toString(),
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
          // Selector<Counter, Counter>(
          //   selector: (context, counter) => Counter(),
          //   builder: (context, value, child) => Text(
          //     '${value.count}',
          //     style: Theme.of(context).textTheme.headlineMedium,
          //   ),
          // ),
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

  Widget myFloatingActionButton(counter, student) {
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
        const SizedBox(width: 10),
        FloatingActionButton(
          onPressed: () {
            counter.decrement();
          },
          tooltip: 'Decrement',
          child: const Icon(
            Icons.remove,
          ),
        ),
        const SizedBox(width: 10),
        FloatingActionButton(
          onPressed: () {
            student.name = 'Jagu';
          },
          tooltip: 'Change Name',
          child: const Icon(
            Icons.change_circle_outlined,
          ),
        ),
        const SizedBox(width: 10),
        FloatingActionButton(
          onPressed: () {
            student.rollNo = 111;
          },
          tooltip: 'Change RollNo',
          child: const Icon(
            Icons.chair,
          ),
        ),
      ],
    );
  }
}
