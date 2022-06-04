import 'package:flutter/material.dart';
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};
  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty? data : ModalRoute.of(context)!.settings.arguments as Map;
    print(data);
  String bgimage = data['isDayTime'] ? 'day.png' : 'night.png';
  Color? bgColor = data['isDayTime'] ? Colors.blue : Colors.indigo[700];
    return Scaffold(backgroundColor: bgColor,
      body:Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/$bgimage'),
            fit: BoxFit.cover,
          )
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 128, 0, 0),
          child: SafeArea(
            child:Column(
            children: [
              FlatButton.icon(
                  onPressed:() async{
                  dynamic result =  await Navigator.pushNamed(context, '/location');
                  setState(() {
                    data = {
                      'time': result['time'],
                      'location': result['location'],
                      'flag': result['flag'],
                      'isDayTime':result['isDayTime']
                    };
                  });
                  },
              icon: const Icon(Icons.edit_location,),
              label: const Text('Edit Location',
                style: TextStyle(
                color: Colors.white24
                )),),
            SizedBox(height:20.0),
              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    data ['location'],
                    style: TextStyle(
                      fontSize:28.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2.0,
                      color: Colors.white,
                    ),),
                ]),
              SizedBox(height: 20.0,),
              Text(
                data['time'],
                style: TextStyle(
                  fontSize: 66.0,
                  letterSpacing: 2.0,
                  color: Colors.white,
                ),
              )
            ],
          ),),
        ),
      )
    );
  }
}
