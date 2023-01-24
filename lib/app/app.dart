import 'package:flutter/material.dart';
import 'package:pace_assignment/presentation/resources/routes_manager.dart';
import 'package:pace_assignment/presentation/resources/themes_manager.dart';

class MyApp extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  MyApp._internal();

  static final MyApp instance = MyApp._internal();

  factory MyApp() => instance;

  @override
  // ignore: library_private_types_in_public_api
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: RouteGenerator.getRoute,
      initialRoute: Routes.mainRoute,
      theme: getApplicationTheme(),
    );
  }
}
