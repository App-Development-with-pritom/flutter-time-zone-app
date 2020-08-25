import 'package:flutter/material.dart';
import 'package:world_time_zone/pages/choose_location.dart';
import 'package:world_time_zone/pages/home.dart';
import 'package:world_time_zone/pages/loading.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/',
  routes:{
    '/': (context) => Loading(),
    '/home': (context) => Home(),
    '/location': (context) => ChooseLocation(),
  },
));

