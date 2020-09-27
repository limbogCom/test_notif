import 'package:android_alarm_manager/android_alarm_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_noti/notifHelper.dart';
import 'package:flutter_test_noti/sharedPrefs.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomizedNotif extends StatefulWidget {
  @override
  _CustomizedNotifState createState() => _CustomizedNotifState();
}

class _CustomizedNotifState extends State<CustomizedNotif> {
  String startTime = "";
  String endTime = "";

  void initState(){
    super.initState();
    getTime();
  }

  static periodicCallback(){
    NotifHelper().showNotifBtweenInterval();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: Container(
                  child: Column(
                    children: [
                      Text("Notif Start", style: TextStyle(fontSize: 30)),
                      SizedBox(
                        height: 20,
                      ),
                      Text(startTime, style: TextStyle(fontSize: 30)),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  child: Column(
                    children: [
                      Text("Notif Stop", style: TextStyle(fontSize: 30)),
                      SizedBox(
                        height: 20,
                      ),
                      Text(endTime, style: TextStyle(fontSize: 30)),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  child: Column(
                    children: [
                      Container(
                        child: RaisedButton(
                          onPressed: () async {
                              WidgetsFlutterBinding.ensureInitialized();
                              await AndroidAlarmManager.initialize();
                              onTimePeriodic();
                          },
                          child: Text("OK"),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  onTimePeriodic(){
    SharedPreferences.getInstance().then((value) async {
      var a = value.getBool('oneTimePeriodic') ?? false;
      if(!a){
        await AndroidAlarmManager.periodic(Duration(minutes: 1), 0, periodicCallback);
        onlyOneTimePeriodic();
      }else{
        print("Cannot run more than once");
      }
    });
  }


  getTime(){
    SharedPreferences.getInstance().then((value) {
      var a = value.getString('startTime');
      var b = value.getString('endTime');
      if(a != null && b != null){
        setState(() {
          startTime = DateFormat('jm').format(DateTime.parse(a));
          endTime = DateFormat('jm').format(DateTime.parse(b));
        });
      }
    });
  }
}
