import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class WeatherForecast{

  late String location;
  late String flag;
  late String time;
  late String url;
  late String isDayTime;
  late String weather;

  WeatherForecast({required this.location, required this.flag, required this.url});

  Future <void> getWeather() async {
    try {
      //make request
      var array = await url.split('/');
      Response response = await get(Uri.parse(
          'https://api.openweathermap.org/data/2.5/weather?q=${array[1]}&units=metrics&appid=36e36a9388c29ac0608201ae938a8b42'));
      Map data = jsonDecode(response.body);

      //get properties from data
      String weatherforecast = data['temp'];
      weather = weatherforecast;
      print(weather);
    }
    catch(e){
      print('Caught error $e');
      print('Cannot load temperature due to some error');
    }
  }


}