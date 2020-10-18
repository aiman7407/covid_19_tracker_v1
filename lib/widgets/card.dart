import 'package:flutter/material.dart';
import 'package:covid_19_tracker/src/styles_constants.dart';

class MyCard extends StatelessWidget {

  final String statues;
  final int number;
  final String picName;
  final color;


  MyCard({this.statues, this.number,this.picName,this.color});

  @override
  Widget build(BuildContext context) {
    return Container(

      decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)),
        color: upperColor.withOpacity(0.35),

      ) ,

      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      margin: EdgeInsets.symmetric(horizontal: 15,vertical: 10),



      child: Column(

        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[

          //Image.asset('images/dice.png'),


          Flexible(
            child:Image.asset('images/$picName.png')
            ,


          ),

          Text(statues,style: TextStyle(fontSize: 25,fontFamily: 'Changa',fontWeight: FontWeight.bold,color: textColor)),
          Text('$number',style: TextStyle(fontSize: 20,fontFamily: 'Changa',fontWeight: FontWeight.w700,color: color),),




        ],
      ),

    );
  }
}
