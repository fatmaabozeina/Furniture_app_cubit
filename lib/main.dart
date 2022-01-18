import 'package:flutter/material.dart';
import 'package:lyans_creative_task/dio_helper.dart';
import 'package:lyans_creative_task/home_page.dart';

void main() {
  DioHelper.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
