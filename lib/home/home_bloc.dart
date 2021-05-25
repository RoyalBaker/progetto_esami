import 'dart:async';

import 'package:progetto_esami/model/weather.dart';
import 'package:progetto_esami/repositories/weatherrepository.dart';
import 'package:template_package/template_package.dart';

import 'home_event.dart';
import 'home_state.dart';

class HomeBlock extends TemplateBloc {
  final WeatherRepository repository;
  final StreamController weatherDataStateController = StreamController<WeatherDataState>();

  HomeBlock(BaseAnalytics analytics, this.repository) : super(analytics) {
    registerStreams([weatherDataStateController.stream]);
    updateUi();
  }

  Future updateUi() async {
    repository.registerWeatherEvents().listen((List<WeatherDay> weatherDays) {
      weatherDataStateController.sink.add(WeatherDataState(
          humidity: weatherDays.first.humidity,
          location: weatherDays.first.location,
          rain: weatherDays.first.rain,
          pressure: weatherDays.first.pressure,
          temperature: weatherDays.first.temperature,
          lpg: weatherDays.first.lpg,
          smoke: weatherDays.first.smoke,
          alcohol: weatherDays.first.alcohol,
          enabled: weatherDays.first.enabled
      ));

      ;
    });
  }

  @override
  void onUiDataChange(BaseBlocEvent event) {
    if (event is IsEnabledChangeEvent ){
      repository.changeEnableValue(event.isEnabled);
    }

  }

  @override
  dispose() {
    weatherDataStateController.close();
    return super.dispose();
  }
}
