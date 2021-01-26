import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providers_example/providers/counter_provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CounterProvider _counterProvider = CounterProvider();

  @override
  void initState() {
    super.initState();
    _counterProvider.addListener(() {
      print('new value ${_counterProvider.counter}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _counterProvider,
      child: Scaffold(
        body: Center(
          // consumer é utilizado para atulizar a tela quando usa um provider
          child: Consumer<CounterProvider>(
            builder: (_, provider, widget) {
              return Text(provider.counter.toString());
            },
          ),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () {
                _counterProvider.increment();
              },
            ),
            SizedBox(width: 10), 
            FloatingActionButton(
              child: Icon(Icons.remove),
              onPressed: () {
                _counterProvider.decrement();
              },
            ),
          ],
        ),
      ),
    );
  }
}
