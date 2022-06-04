import 'package:flutter/material.dart';
import 'package:world_time/servicies/world_timeee.dart';

class Location extends StatefulWidget {
  const Location({Key? key}) : super(key: key);

  @override
  _LocationState createState() => _LocationState();
}

class _LocationState extends State<Location> {
  List<WorldTime>locations=[
    WorldTime(location: 'London', flag:'uk.png', url:'Europe/London'),
    WorldTime(location: 'Berlin', flag: 'germany.png', url: 'Europe/Berlin'),
    WorldTime(location: 'Athens', flag:'greece.png', url:'Europe/Athens'),
    WorldTime(location: 'Cairo', flag:'egypt.png', url:'Africa/Cairo'),
    WorldTime(location: 'Nairobi', flag:'kenya.png', url:'Africa/Nairobi'),
    WorldTime(location: 'Chicago', flag:'usa.png', url:'America/Chicago'),
    WorldTime(location: 'NewYork', flag:'usa.png', url:'America/New_York'),
    WorldTime(location: 'Seoul', flag:'korea.png', url:'Asia/Seoul'),
    WorldTime(location: 'Jakarta', flag:'indonesia.png', url:'Asia/Jakarta'),
    WorldTime(location: 'Lagos', flag:'lagos.png', url:'Africa/Lagos'),
  ];
  void updateTime(index)async{
    WorldTime example = locations[index];
    await example.getTime();
    Navigator.pop(context, {
      'location': example.location,
      'flag': example.flag,
      'time':example.time ,
      'isDayTime':example.isDayTime
    });
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: const Text('Choose A Location'),
        centerTitle: true,
        backgroundColor: Colors.blue[900],
        elevation: 00,
      ),
      body: ListView.builder(
          itemCount: locations.length,
          itemBuilder:(context, index){
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 2),
              child: Card(
              child:ListTile(
                 onTap:(){updateTime(index);} ,
                title: Text(locations[index].location.toString()),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('images/${locations[index].flag}'),
                ),
              ) ,
              ),
            );
    }
    ));
  }
}
