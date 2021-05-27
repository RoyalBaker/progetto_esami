import 'dart:async';
import 'package:progetto_esami/entriprese_business_rules/weather_ebr.dart';
import 'package:progetto_esami/model/weather.dart';
import 'package:progetto_esami/repositories/weatherrepository.dart';
import 'package:template_package/template_package.dart';

import 'home_event.dart';
import 'home_state.dart';

class HomeBlock extends TemplateBloc {
  final WeatherRepository repository;
  final StreamController weatherDataStateController = StreamController<WeatherDataState>();
  final WeatherEbr weatherEbr;
  final String backgroundUrl =
      "https://www.wallpapertip.com/wmimgs/61-615086_color-gradient-colour-gradient-wallpaper-hd.jpg";

  HomeBlock(BaseAnalytics analytics, this.repository, this.weatherEbr) : super(analytics) {
    registerStreams([weatherDataStateController.stream]);
    updateUi();
  }

  Future updateUi() async {
    repository.registerWeatherEvents().listen((List<WeatherDay> weatherDays) {
      final weatherType = weatherEbr.getWeatherType(weatherDays.first.rain);
      final weatherDay = weatherDays.first;

      weatherDataStateController.sink.add(WeatherDataState(
          humidity: weatherDay.humidity,
          location: weatherDay.location,
          rain: weatherDay.rain,
          pressure: weatherDay.pressure,
          temperature: weatherDay.temperature,
          lpg: weatherDay.lpg,
          smoke: weatherDay.smoke,
          alcohol: weatherDay.alcohol,
          enabled: weatherDay.enabled,
          animationUrl: weatherType.getAnimationUrl(),
          backgroundUrl: backgroundUrl));
    });
  }

  @override
  void onUiDataChange(BaseBlocEvent event) {
    if (event is IsEnabledChangeEvent) {
      repository.changeEnableValue(event.isEnabled);
    }
  }

  @override
  dispose() {
    weatherDataStateController.close();
    return super.dispose();
  }
}
