import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};

  @override
  Widget build(BuildContext context) {

    data = ModalRoute.of(context)?.settings.arguments as Map<dynamic, dynamic>? ?? {};
    print(data);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pushNamed(context, '/location');
                  },
                  label: Text('edit location'),
                  icon: Icon(Icons.edit_location),
              ),
              SizedBox(height: 20.00),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    data['location'],
                    style: TextStyle(
                      fontSize: 28.0,
                      letterSpacing: 2.0,
                    ) ,
                  )
                ],
              ),
              SizedBox(height: 20.00,),
              Text(
                data['time'],
                style: TextStyle(
                  fontSize: 60.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

