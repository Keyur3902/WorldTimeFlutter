import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime{

  late String location; //set the location in ui
  late String time; //set the time of location in ui
  late String url; //url of location
  late String flag; //flag of that location
  late String weatherForecast; //set the weather in ui
  late bool isDayTime;


  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async {

    try{
      //make the request
      var response = await http.get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
      Map data  = jsonDecode(response.body);

      //get properties from data
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1,3);

      //create DataTime object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      //set the time property
      isDayTime = now.hour > 6 && now.hour < 20 ? true : false;
      time = DateFormat.jm().format(now);
    }

    catch(e){
      print('Caught error $e');
      time = 'Could not load Time due to some error';
    }
  }

  // Future<void> getWeather() async{
  //   try {
  //     //make request
  //     var array = url.split('/');
  //     Response response = await get(Uri.parse(
  //         'https://api.openweathermap.org/data/2.5/weather?q=${array[1]}&units=metrics&appid=36e36a9388c29ac0608201ae938a8b42'));
  //     Map data = jsonDecode(response.body);
  //
  //     //get properties from data
  //     var main = data['main'];
  //     double weatherForecast = main['temp'];
  //     //print(weatherforecast);
  //   }
  //   catch(e){
  //     print('Caught error $e');
  //     print('Cannot load temperature due to some error');
  //   }
  // }


}