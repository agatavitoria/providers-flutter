import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providers_example/providers/counter_provider.dart';
import 'package:providers_example/providers/user_provider.dart';

class DetalhesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final UserProvider userProvider = Provider.of<UserProvider>(context, listen: false);
    final CounterProvider counterProvider = Provider.of<CounterProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Consumer<UserProvider>(
          builder: (_, provider, widget) {
            return Text(userProvider.lastName ?? 'NULO');
          },
        ),
      ),
    );
  }
}