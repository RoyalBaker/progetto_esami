import 'dart:async';

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
        temperature: 27,
        lpg: 0.6,
        smoke: 0.7,
        alcohol: 14));
    final weatherReferences = db.reference().child("app-progetto-esami-default-rtdb").child("power");
    try{
      await weatherReferences.set({});
    }catch (error){
      Fluttertoast.showToast(msg: "error in catch");
    }
    final dataOnce = await weatherReferences.once();
    weatherReferences.onChildChanged.listen((event) {
      final data = event.snapshot.value;
      Fluttertoast.showToast(msg: "changed...");
    });
  }

  @override
  void onUiDataChange(BaseBlocEvent event) {}

  @override
  dispose() {
    weatherDataStateController.close();
    return super.dispose();
  }
}
