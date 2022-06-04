import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String? location;
  String? time;
  String? flag;
  String? url;
  bool? isDayTime;
  WorldTime({this.location, this.flag, this.url});

  Future<void> getTime() async{

    try{
    Response response = await get(Uri.parse('https://worldtimeapi.org/api/timezone/$url'));
    Map data = jsonDecode(response.body);

    String datetime = data['datetime'];

    DateTime now = DateTime.parse(datetime.substring(0,26));

    isDayTime = now.hour > 5 && now.hour < 19 ? true : false;
    time = DateFormat.jm().format(now);}

    catch (e) {
      print ('caught error: $e');
      time = ' could not locate time data';
    }

  }



}