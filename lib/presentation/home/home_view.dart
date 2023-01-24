import 'package:flutter/material.dart';
import 'package:pace_assignment/presentation/resources/strings_manager.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  var _title = AppString.headlines;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        _title,
        style: Theme.of(context).textTheme.headline1,
      )),
      body: Center(child: Text("sdkjfkdj")),
    );
  }
}
