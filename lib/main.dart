import 'package:flutter/material.dart';
import 'package:world_time_flutter/pages/choose_location.dart';
import 'package:world_time_flutter/pages/home.dart';
import 'package:world_time_flutter/pages/loading.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  initialRoute: '/',
  routes: {
    '/home': (context) => Home(),
    '/': (context) => Loading(),
    '/location': (context) => ChooseLocation(),
  },
));

