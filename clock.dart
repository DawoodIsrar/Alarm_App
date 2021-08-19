import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class Clock extends StatefulWidget {
  @override
  _ClockState createState() => _ClockState();
}

class _ClockState extends State<Clock> {
  @override void initState(){
    Timer.periodic(Duration(seconds: 1), (timer) { 
      setState(() {
              
            });
    });
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      
      child: Transform.rotate(
         angle: -pi / 2,
        child: 
        CustomPaint(
          painter: ClockPainter(),
        ),
      ),
    );
  }
}
class ClockPainter extends CustomPainter
{

  var dateTime =  DateTime.now();
  //60sec -360 degree , 1 sec - 6 sec 360/60
  
  @override void paint(Canvas canvas, Size size) { 
    var centerX = size.width/2;
    var centerY = size.height/2;
    var center = Offset(centerX, centerY);
    var radius = min(centerX,centerY);

    var fillBrush = Paint()
    ..color = Color.fromARGB(10, 5, 50, 20);
   

    var outline = Paint()
    ..color = Colors.white30
    ..style = PaintingStyle.stroke
    ..strokeWidth = 20;

   var centerBrush = Paint()
    ..color = Colors.white54; 
  
   var secBrush = Paint()
    ..shader = RadialGradient(colors: [Colors.yellow,Colors.amberAccent])
      .createShader(Rect.fromCircle(center: center, radius: radius)) 
    ..style = PaintingStyle.stroke
    ..strokeCap = StrokeCap.round
    ..strokeWidth = 6;


  var minBrush = Paint()
  ..shader = RadialGradient(colors: [Colors.orange,Colors.pinkAccent])
      .createShader(Rect.fromCircle(center: center, radius: radius)) 
    ..style = PaintingStyle.stroke
    ..strokeCap = StrokeCap.round
    ..strokeWidth = 8;

  var hourBrush = Paint()
  ..shader = RadialGradient(colors: [Colors.blue,Colors.yellow])
      .createShader(Rect.fromCircle(center: center, radius: radius)) 
    ..color = Colors.lightBlue
    ..strokeCap = StrokeCap.round 
    ..style = PaintingStyle.stroke
    ..strokeWidth = 10;

  var outlinesBrush = Paint()
  ..shader = RadialGradient(colors: [Colors.white,Colors.yellow])
      .createShader(Rect.fromCircle(center: center, radius: radius)) ;

     canvas.drawCircle(center, radius - 40, fillBrush);
     canvas.drawCircle(center, radius - 40, outline);

     var secX = centerX + 90 * cos(dateTime.second* 6 * pi / 180);
     var secY = centerX + 90 * sin(dateTime.second* 6 * pi / 180);
     canvas.drawLine(center, Offset(secX,secY) , secBrush);

     var minX = centerX + 90 * cos(dateTime.minute* 6  * pi / 180);
     var minY = centerX + 90 * sin(dateTime.minute* 6  * pi / 180);
     canvas.drawLine(center, Offset(minX,minY) , minBrush);

     var hrX = centerX + 90 * cos((dateTime.hour*30 + dateTime.minute*0.5) * pi / 180);
     var hrY = centerX + 90 * sin((dateTime.hour*30 + dateTime.minute*0.5) * pi / 180);
     canvas.drawLine(center, Offset(hrX,hrY) , hourBrush);
     canvas.drawCircle(center, 16, centerBrush);
     var outercircleRadius = radius;
     var innercircleRadius = radius-14;
    for(double i=0; i<360 ; i+=12){

       var x1 = centerX + outercircleRadius * cos(i* pi/ 180);
        var y1 = centerX + outercircleRadius * sin(i* pi/ 180);

        var x2 = centerX + innercircleRadius * cos(i* pi/ 180);
         var y2 = centerX + innercircleRadius * sin(i* pi/ 180);

          canvas.drawLine(Offset(x1,y1), Offset(x2, y2), outlinesBrush);
           }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
 
}