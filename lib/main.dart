import 'package:flutter/material.dart';
import 'package:worldtime_weather/pages/choose_location.dart';
import 'package:worldtime_weather/pages/home.dart';
import 'package:worldtime_weather/pages/loading.dart';

import 'auth/keys.dart';

String? apiKey;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  apiKey = (await SecretLoader(secretPath: "lib/auth/secrets.json").load()).apikey;

  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => const Loading(),
      '/home': (context) => const Home(),
      '/location': (context) => const ChooseLocation(),
    },
  ));
}
