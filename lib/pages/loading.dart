import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:world_time/servicies/world_timeee.dart';



class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {



  void setupWorldTime() async {
    WorldTime instance = WorldTime(location: 'Berlin', flag: 'germany.png', url: 'Europe/Berlin');
   await instance. getTime();
   Navigator.pushReplacementNamed(context, '/home', arguments: {
     'location': instance.location,
    'flag': instance.flag,
    'time':instance.time ,
   'isDayTime': instance.isDayTime});

    }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setupWorldTime();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(backgroundColor: Colors.blue,
      body: Padding(
        padding: EdgeInsets.all(50),
        child: CircularProgressIndicator(

        ),
      )
    );
  }
}
