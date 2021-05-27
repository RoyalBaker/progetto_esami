import 'package:progetto_esami/weathwer_types/weather_type.dart';

class Rain extends WeatherType {
  @override
  String getAnimationUrl() {
    return "https://assets8.lottiefiles.com/temp/lf20_rpC1Rd.json";
  }

  @override
  bool isInTypeRange(int rainIntensity) => rainIntensity > 100 && rainIntensity < 500;
}
