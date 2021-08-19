import 'package:flutter/material.dart';

import 'clock.dart';

class Alarm extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
     
     var now = DateTime.now();
    
    var formattedDate = '${now.year.toString()}-${now.month.toString()}-${now.day.toString()}';
    var formattedTime = '${now.hour.toString()}:${now.minute.toString()}';
    var timeZone = now.timeZoneOffset.toString().split('.').first;
    var offSign = '';
    if(!timeZone.startsWith('-')){
      offSign = '+';
    }
    return Scaffold(
      backgroundColor: Colors.black26,
      body:Row(
        children:<Widget> [    
             
           
             Column(
                     mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FlatButton(
                      padding: const EdgeInsets.symmetric(vertical: 16,horizontal:0),
                       onPressed: (){
                     decoration: InputDecoration(
                       fillColor: Colors.white,
                     );
                    }, child: Column(
                   children: <Widget> [
                  Image.asset(cimageSource,scale: 3.5,),
                  Text(currentmenu.title,style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                  ),),
                  SizedBox(height: 10,)
                 ],),
                 )
                  ],
                ),
           
              VerticalDivider(color: Colors.white,
                   width: 1,),
             Expanded(
                  child: Container(
                     padding: EdgeInsets.all(10),
                     child: Column(
                       
             crossAxisAlignment: CrossAxisAlignment.start,
            
             children:<Widget> [
               SizedBox(height: 50,),
               Text('Clock', style: TextStyle(
                     fontSize: 30,
                     fontWeight: FontWeight.bold,
                     color: Colors.white,
               ),),
               SizedBox(height: 10,),
                Text(formattedTime,style: TextStyle(
                     fontSize: 60,
                     color: Colors.white
               ),),
               SizedBox(height: 10,),
                Text(formattedDate,style: TextStyle(
                     fontSize: 25,
                     color: Colors.white
               ),),
               SizedBox(height: 50,),
               Clock(),
               SizedBox(height: 15,),
              Text('Timezone', style: TextStyle(
                     fontSize: 20,
                     fontWeight: FontWeight.bold,
                     color: Colors.white,
               ),),
               
               Row(
                     children: [
                       Icon(Icons.language,color: Colors.white,),
                       SizedBox(
                         width: 2,
                       ),
                       Text('UTC'+ offSign + timeZone,style: TextStyle( color: Colors.white),),
                     ],
               ),
             ],
             ),
                   ),
                 ),
             ],
           )
           
        );
        
  }
  Widget buildMenuButton(MenuInfo currentmenu){
  
  return 
}
}
