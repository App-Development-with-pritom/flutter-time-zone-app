import 'package:http/http.dart';
import 'dart:convert';

import 'package:intl/intl.dart';

class WorldTime{
  String location;
  String time;
  String flag;
  String url;

  WorldTime({ this.location, this.flag , this.url});

  Future <void> getTime() async {

    try{
        //    make the request
        Response response = await get('http://worldtimeapi.org/api/timezone/$url');
        Map data = jsonDecode(response.body);
        //   print(data);

        //    get data from response
        String dateTime = data['datetime'];
        String offset = data['utc_offset'].substring(1,3);

        //    set datetime
        DateTime now = DateTime.parse(dateTime);
        now = now.add(Duration(hours: int.parse(offset)));

        //    set time to property
        time = DateFormat.jm().format(now);
        //     print(time);

    }catch(e){
        print('caught exception $e');
        time = "Could not get time";
    }

  }

}

