import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providers_example/providers/counter_provider.dart';
import 'package:providers_example/widgets/child_counter.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CounterProvider _counterProvider = CounterProvider();

  @override
  void initState() {
    super.initState();
    _counterProvider.addListener(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _counterProvider,
      child: Scaffold(
        body: Center(
          // consumer é utilizado para atulizar a tela quando usa um provider
          child: Container(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Consumer<CounterProvider>(
                  builder: (_, provider, widget) {
                    return Text(provider.counter.toString());
                  },
                ),
                ChildCounter(),
              ],
            ),
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
