import 'package:flutter/material.dart';

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Row(
        //mainAxisAlignment: MainAxisAlignment.start,
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: 80,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FlatButton(
                  onPressed: () {
                    setState(() {
                      SignUp;
                    });
                    decoration:
                    InputDecoration(
                      fillColor: Colors.white,
                    );
                  },
                  child: Column(
                    children: <Widget>[
                      Image.asset(
                        'images/clock.png',
                        scale: 0.5,
                      ),
                      Text(
                        'Clock',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
                FlatButton(
                  onPressed: () {
                    setState(() {
                      SetAlarm();
                    });
                    decoration:
                    InputDecoration(
                      fillColor: Colors.white,
                    );
                  },
                  child: Column(
                    children: <Widget>[
                      Image.asset(
                        'images/alarmicon.png',
                        scale: 0.5,
                      ),
                      Text(
                        'Alarm',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ]);
  }
}
