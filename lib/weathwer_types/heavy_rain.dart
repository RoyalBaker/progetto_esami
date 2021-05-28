import 'package:progetto_esami/weathwer_types/weather_type.dart';

class HeavyRain extends WeatherType {
  @override
  String getAnimationUrl() {
    return "https://assets8.lottiefiles.com/temp/lf20_XkF78Y.json";
  }

  @override
  bool isInTypeRange(int rainIntensity) => rainIntensity >= 500;
}
