import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providers_example/providers/counter_provider.dart';

class ChildCounter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('build childProvider');
    final counterProvider = Provider.of<CounterProvider>(context, listen: false);

    return Container(
      padding: EdgeInsets.all(20),
      child: Row(
        children: [
          Consumer<CounterProvider>(
            builder: (_, provider, widget) {
              return Text('child counter ${provider.counter}');
            },
          ),
          FlatButton(
            child: Text('RESET'),
            onPressed: () => counterProvider.reset(),
          ),
        ],
      )
    );
  }
}