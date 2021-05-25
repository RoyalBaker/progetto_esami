import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:progetto_esami/model/weather.dart';

class WeatherRepository {
  final FirebaseFirestore _db;
  static const WEATHER_DAYS = "WEATHER_DAYS";
  static const DAY_KEY = "iUOIDUQACO7nYMFdDORj";

  WeatherRepository(this._db);

  Stream<List<WeatherDay>> registerWeatherEvents() {
    final snapshot = _db.collection(WEATHER_DAYS).snapshots();
    return snapshot
        .transform(StreamTransformer.fromHandlers(handleData: (QuerySnapshot querySnapshot, EventSink sink) {
      final weatherDays = querySnapshot.docs.map((e) => WeatherDay.fromMap(e.data())).toList();
      sink.add(weatherDays);
    }));
  }

  Future<void> changeEnableValue(bool isEnabled)async {
    await _db.collection(WEATHER_DAYS).doc(DAY_KEY).update({"enabled" : isEnabled});
  }
}
