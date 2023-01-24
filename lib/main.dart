import 'package:flutter/material.dart';
import 'package:pace_assignment/app/app.dart';
import 'package:pace_assignment/app/di.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initAppModule();
  runApp(MyApp());
}
