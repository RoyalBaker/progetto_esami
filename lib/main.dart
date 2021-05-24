import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:progetto_esami/app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(MyApp());
}
