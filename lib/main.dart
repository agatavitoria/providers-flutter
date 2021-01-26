import 'package:flutter/material.dart';
import 'package:providers_example/pages/detalhe_page.dart';
import 'package:providers_example/pages/home_page.dart';
import 'package:provider/provider.dart';
import 'package:providers_example/pages/user_form.dart';
import 'package:providers_example/providers/counter_provider.dart';
import 'providers/user_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // se for usar muito providers, no lugar de ChangeNotifierProvider deve utilizar MultiProvider
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=> UserProvider()),
        ChangeNotifierProvider(create: (_)=> CounterProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        routes: {
          'detalhes' : (_) => DetalhesPage()
        },
        home: UserFormPage(),
      ),
    );
  }
}
