import 'package:flutter/material.dart';
import 'package:world_time_flutter/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  String time = 'loading';
  String weatherForecast = 'loading';

  void setupWorldTime() async {
    WorldTime instance = WorldTime(location: 'Berlin', flag: 'germany.png', url: 'Europe/Berlin');
    await instance.getTime();
    //await instance.getWeather();

    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDayTime': instance.isDayTime,
      //'weatherForecast': instance.weatherForecast,
    });
  }

  @override
  void initState() {
    print('initstate called');
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    print('build called for load');
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Center(
        child: SpinKitPouringHourGlass(
          color: Colors.white,
          size: 80.0,
        ),
      ),
    );
  }
}
