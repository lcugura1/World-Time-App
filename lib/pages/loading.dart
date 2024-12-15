import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:worldtime_weather/main.dart'; // Pristup globalnoj varijabli apiKey

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void getTime() async {
    const timezone = 'Europe/London';
    const apiUrl = 'https://api.api-ninjas.com/v1/worldtime?timezone=$timezone';

    if (apiKey == null || apiKey!.isEmpty) {
      print('API ključ nije pronađen!');
      return;
    }

    try {
      final response = await http.get(
        Uri.parse(apiUrl),
        headers: {'X-Api-Key': apiKey!},
      );

      if (response.statusCode == 200) {
        print('Response: ${response.body}');
      } else {
        print('Error: ${response.statusCode} - ${response.body}');
      }
    } catch (e) {
      print('Došlo je do greške: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    getTime();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('loading screen')),
    );
  }
}
