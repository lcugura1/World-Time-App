import 'dart:convert';
import 'package:http/http.dart';
import '../main.dart';

class WorldTime {

  //late String location; // location name for the UI
  //late String flag; // url to the asset flag
  String time = ""; // time for the chosen location
  String timezone; // location url for API endpoints

  WorldTime ({
    //required this.location,
    //required this.flag,
    required this.timezone});


  Future<void> getTime() async {
    final apiUrl = 'https://api.api-ninjas.com/v1/worldtime?timezone=$timezone';

    try {
      final response = await get(
        Uri.parse(apiUrl),
        headers: {'X-Api-Key': apiKey!},
      );

      if (response.statusCode == 200) {
        print('Response: ${response.body}');

        Map data = jsonDecode(response.body);
        String dateTime = data['datetime'];
        DateTime now = DateTime.parse(dateTime);
        time = now.toString();
      } else {
        print('Error: ${response.statusCode} - ${response.body}');
      }
    } catch (e) {
      print('Error occurred: $e');
    }
  }

}
