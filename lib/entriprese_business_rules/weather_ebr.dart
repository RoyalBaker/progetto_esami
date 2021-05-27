import 'package:progetto_esami/weathwer_types/heavy_rain.dart';
import 'package:progetto_esami/weathwer_types/rain.dart';
import 'package:progetto_esami/weathwer_types/sunny.dart';
import 'package:progetto_esami/weathwer_types/weather_type.dart';

class WeatherEbr {
  final List<WeatherType> _weatherTypes = [Sunny(), Rain(), HeavyRain()];

  WeatherType getWeatherType(int rainIntensity) {
    return _weatherTypes.singleWhere((element) => element.isInTypeRange(rainIntensity));
  }
}
