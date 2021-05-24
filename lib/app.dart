import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:progetto_esami/home/home_bloc.dart';
import 'home/home_page.dart';
import 'package:template_package/analytics/analytics_proxy.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(() => HomeBlock(AnalyticsProxy([]), FirebaseDatabase.instance)),
    );
  }
}
