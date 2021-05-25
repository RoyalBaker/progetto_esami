import 'package:template_package/template_package.dart';

class WeatherDataState extends BaseBlocDataState {
  final int humidity;
  final String location;
  final int rain;
  final int pressure;
  final double temperature;
  final double lpg;
  final double smoke;
  final int alcohol;
  final bool enabled;

  WeatherDataState(
      {required this.humidity,
      required this.location,
      required this.rain,
      required this.pressure,
      required this.temperature,
      required this.lpg,
      required this.smoke,
      required this.alcohol,
      required this.enabled});

  String getHumidity() => humidity.toString();

  String getLocation() => location.toString();

  String getRain() => rain.toString();

  String getPressure() => pressure.toString();

  String getTemperature() => temperature.toInt().toString();

  String getLpg() => lpg.toString();

  String getSmoke() => smoke.toString();

  String getAlcohol() => alcohol.toString();

  bool isEnabled() => this.enabled;
}
