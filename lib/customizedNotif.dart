import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomizedNotif extends StatefulWidget {
  @override
  _CustomizedNotifState createState() => _CustomizedNotifState();
}

class _CustomizedNotifState extends State<CustomizedNotif> {
  String startTime = "";
  String endTime = "";
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
                          onPressed: (){

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
  getTime(){

  }
}
