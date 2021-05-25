class WeatherDay {
  final int humidity;
  final String location;
  final int rain;
  final int pressure;
  final double temperature;
  final double lpg;
  final double smoke;
  final int alcohol;

  WeatherDay(
      {required this.humidity,
      required this.location,
      required this.rain,
      required this.pressure,
      required this.temperature,
      required this.lpg,
      required this.smoke,
      required this.alcohol});

  factory WeatherDay.fromMap(Map<String, dynamic> mapJson) {
    return WeatherDay(
      humidity: mapJson["humid"],
      rain: mapJson["rain"],
      location: mapJson["location"],
      pressure: mapJson["pressure"],
      temperature: (mapJson["temp"] as int).toDouble(),
      lpg: mapJson["lpg"],
      smoke: mapJson["smoke"],
      alcohol: mapJson["alcohol"]
    );
  }
}
