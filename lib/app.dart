import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:progetto_esami/home/home_bloc.dart';
import 'package:progetto_esami/repositories/weatherrepository.dart';
import 'package:template_package/analytics/analytics_proxy.dart';

import 'home/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(() => HomeBlock(AnalyticsProxy([]), WeatherRepository(FirebaseFirestore.instance))),
    );
  }
}
