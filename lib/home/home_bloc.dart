import 'dart:async';

import 'package:template_package/template_package.dart';

import 'home_state.dart';

class HomeBlock extends TemplateBloc {
  final StreamController weatherDataStateController = StreamController<WeatherDataState>();

  HomeBlock(BaseAnalytics analytics) : super(analytics) {
    registerStreams([weatherDataStateController.stream]);
    updateUi();
  }

  Future updateUi() async {
    weatherDataStateController.sink.add(WeatherDataState(
        humidity: 70,
        location: "cassino",
        rain: 30,
        pressure: 909,
        temperature: 25,
        lpg: 0.6,
        smoke: 0.7,
        alcohol: 14));

    await Future.delayed(
      Duration(seconds: 5),
    );
    weatherDataStateController.sink.add(WeatherDataState(
        humidity: 70,
        location: "cassino",
        rain: 0,
        pressure: 9,
        temperature: 7,
        lpg: 0.6,
        smoke: 0.7,
        alcohol: 14));
  }

  @override
  void onUiDataChange(BaseBlocEvent event) {}

  @override
  dispose() {
    weatherDataStateController.close();
    return super.dispose();
  }
}
