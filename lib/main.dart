import 'package:bloc_base_app/app/di/injection.dart';
import 'package:bloc_base_app/app/my_app.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();

  runApp(const MyApp());
}
