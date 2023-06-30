import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    print('build called for home');


    data = data.isNotEmpty ? data : ModalRoute.of(context)?.settings.arguments as Map;
    print(data);

    //set background
    String bgImage = data['isDayTime']==true ? 'day.png' : 'night.png';
    Color? bgColor = data['isDayTime']==true ? Colors.blue : Colors.indigo[700];

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$bgImage'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 128.0, 0, 0),
            child: Column(
              children: [
                ElevatedButton.icon(
                    onPressed: () async {
                      dynamic result = await Navigator.pushNamed(context, '/location');
                      setState(() {
                        data = {
                          'location': result['location'],
                          'flag': result['flag'],
                          'time': result['time'],
                          //'weatherForecast': result['weatherForecast'],
                          'isDayTime': result['isDayTime'],
                        };
                      });
                    },
                    icon: Icon(
                      Icons.edit_location,
                      color: Colors.grey[300],
                    ),
                  label: Text(
                    'Edit Location',
                    style: TextStyle(
                      color: Colors.grey[300],
                    ),),
                ),
                SizedBox(height: 20.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      data['location'],
                      style: TextStyle(
                        fontSize: 28.0,
                        color: Colors.white,
                        letterSpacing: 2.0,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.0,),
                Text(
                  data['time'],
                  style: TextStyle(
                    fontSize: 50,
                    color: Colors.white,
                  ),
                ),
                // Text(
                //   data['weatherForecast'],
                //   style: TextStyle(
                //     fontSize: 30,
                //     color: Colors.white,
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
