import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:world_time_zone/services/world_time.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  String time = 'loading';

void setupWorldTime() async{
  WorldTime instance = WorldTime(location:'Dhaka',flag: 'dhaka.png',url: 'Asia/Dhaka');
  await instance.getTime();
  Navigator.pushReplacementNamed(context, '/home', arguments: {
    'location': instance.location,
    'time':instance.time,
    'flag':instance.flag,
  });

}

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body:Center(
        child: SpinKitRing(
          color: Colors.white,
          size: 80.0,
        ),
      )
    );
  }
}
