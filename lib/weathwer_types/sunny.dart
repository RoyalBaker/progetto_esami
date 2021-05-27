import 'package:progetto_esami/weathwer_types/weather_type.dart';

class Sunny extends WeatherType {
  @override
  String getAnimationUrl() {
    return "https://assets8.lottiefiles.com/temp/lf20_Stdaec.json";
  }

  @override
  bool isInTypeRange(int rainIntensity) => rainIntensity < 100;
}
