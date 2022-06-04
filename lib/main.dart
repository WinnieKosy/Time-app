import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:world_time/pages/home.dart';
import 'package:world_time/pages/location_screen.dart';
import 'package:world_time/pages/loading.dart';


void main()=>runApp(MaterialApp(
  initialRoute: '/',
  routes: {
    '/':   (context)=>Loading(),
    '/home':(context)=>Home(),
    '/location':(context)=>Location(),
  },
));