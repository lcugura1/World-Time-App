import 'package:flutter/material.dart';
import 'package:worldtime_weather/pages/choose_location.dart';
import 'package:worldtime_weather/pages/home.dart';
import 'package:worldtime_weather/pages/loading.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/home',
  routes: {
    '/': (context) => Loading(),
    '/home': (context) => Home(),
    '/location': (context) => ChooseLocation(),
  },
));
