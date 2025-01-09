import 'package:flutter/material.dart';
import 'package:worldtime_weather/services/world_time.dart';
import 'package:loading_indicator/loading_indicator.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {


  void setupWorldTime() async{
    WorldTime instance = WorldTime(timezone: 'Europe/London'); // definiranje vremenske zone
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.timezone,
      'time': instance.time,
    });


  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: const Center(
        child: LoadingIndicator(
            indicatorType: Indicator.ballClipRotatePulse, /// Required, The loading type of the widget
            colors: const [Colors.black],       /// Optional, The color collections
            strokeWidth: 2,                     /// Optional, The stroke of the line, only applicable to widget which contains line
            backgroundColor: Colors.yellow,      /// Optional, Background of the widget
            pathBackgroundColor: Colors.yellow   /// Optional, the stroke backgroundColor
        ),
      ),
    );
  }
}
