import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:template_package/template_package.dart';

import 'home_state.dart';

class HomeBlock extends TemplateBloc {
  final FirebaseDatabase db;
  final StreamController weatherDataStateController = StreamController<WeatherDataState>();

  HomeBlock(BaseAnalytics analytics, this.db) : super(analytics) {
    registerStreams([weatherDataStateController.stream]);
    updateUi();
  }

  Future updateUi() async {
    weatherDataStateController.sink.add(WeatherDataState(
        humidity: 70,
        location: "cassino",
        rain: 30,
        pressure: 909,
        temperature: 29,
        lpg: 0.6,
        smoke: 0.7,
        alcohol: 14));
    await FirebaseFirestore.instance.collection('collectionPath').doc("hello").set({"aia": 'pollo'});
    FirebaseFirestore.instance.collection('collectionPath').doc("hello").snapshots().listen((event) {
      Fluttertoast.showToast(msg: 'changed');
    });
    Fluttertoast.showToast(msg: 'done');
  }

  @override
  void onUiDataChange(BaseBlocEvent event) {}

  @override
  dispose() {
    weatherDataStateController.close();
    return super.dispose();
  }
}
