import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:progetto_esami/home_page.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Monitoraggio stazione meteo'),
    );
  }
}