import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:progetto_esami/model/weather.dart';

class WeatherRepository {
  final FirebaseFirestore db;
  static const WEATHER_DAYS = "WEATHER_DAYS";

  WeatherRepository(this.db);

  Stream<List<WeatherDay>> registerWeatherEvents() {
    final snapshot = db.collection(WEATHER_DAYS).snapshots();
    return snapshot
        .transform(StreamTransformer.fromHandlers(handleData: (QuerySnapshot querySnapshot, EventSink sink) {
      final weatherDays = querySnapshot.docs.map((e) => WeatherDay.fromMap(e.data())).toList();
      sink.add(weatherDays);
    }));
  }
}
