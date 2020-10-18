import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:covid_19_tracker/widgets/curve_clipper.dart';
import 'file:///E:/AndroidProjects/covid_19_tracker/lib/src/styles_constants.dart';
import 'package:covid_19_tracker/widgets/card.dart';

class CasesScreen extends StatefulWidget {

  final locationStatues;

  CasesScreen({this.locationStatues});

  static const id='ScreenScreen';
  @override
  _CasesScreenState createState() => _CasesScreenState();
}

class _CasesScreenState extends State<CasesScreen> {



  int cases;
  int active;
  int todayCases;
  int todayDeaths;
  int recovered;
  int tests;
  String url;


  @override
  void initState() {
    // TODO: implement initState
    upDateUI(widget.locationStatues);

  }




  void upDateUI(dynamic data)
  {

    setState(() {


      if(data==null)
      {

        cases=0;
        active=0;
        todayCases=0;
        todayDeaths=0;
        recovered=0;
        tests=0;

        return;
      }


       cases=data['cases'];
       active=data['active'];
       todayCases=data['todayCases'];
       todayDeaths=data['todayDeaths'];
       recovered=data['recovered'];
       tests=data['tests'];
       url=data['countryInfo']['flag'];






    });



  }


  @override
  Widget build(BuildContext context) {


    MediaQueryData queryData;
    queryData = MediaQuery.of(context);

    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Container(
        child: Stack(
          children: <Widget>[

            ClipPath(




              clipper: CurveClipper() ,
              child: Container(
                height: queryData.size.height *0.25,
                width: double.infinity,
                decoration:
                BoxDecoration(
                  color: upperColor.withOpacity(0.4),
                  image: new DecorationImage(
                    fit: BoxFit.cover,
                    colorFilter:
                    ColorFilter.mode(Colors.black.withOpacity(0.2),
                        BlendMode.dstATop),
                    image: new NetworkImage(
                     url,
                    ),
                  ),
                ),
//                child: Image.network(url,
//                  alignment: Alignment.center,
//                  fit:BoxFit.fill ,
//                  colorBlendMode: BlendMode.hue ,
//
//                ),

              )

            ),



            Column(

              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[

                SizedBox(height:queryData.size.height *0.23 ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[


                    Container(child: Image.asset('images/virus.png',
                      width: 100,
                      height: 100,
                    ),

                    ),
                    Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[

                           Text('Total Cases',style: kTotalCasesStyle),
                            Text('$cases',style: kTotalCasesNumberStyle),



                            Row(
                              children: <Widget>[
                                Text('Active Cases :',style: kActiveCasesStyle),
                                Text('$active',style: kActiveCasesNumberStyle ),

                              ],
                            ),



                          ],
                        ),
                  ],
                ),

                SizedBox(height: 30),

                Expanded(
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: MyCard(statues: 'Today cases',number: todayCases,picName: 'today_cases',color: numbersColor,) ,
                      ),
                      Expanded(
                        child: MyCard(statues: 'Today death',number: todayDeaths,picName:'death' ,color: numbersColor,) ,
                      )
                    ],
                  ),
                ),



                Expanded(
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: MyCard(statues: 'Recovered', number: recovered,picName: 'recovered',color: Colors.green[700],) ,
                      ),
                      Expanded(
                        child: MyCard(statues: 'Today tests',number: tests,picName: 'test',color: numbersColor,) ,
                      )
                    ],
                  ),
                ),


            ],
            )

          ],
        ),
      ),
    );
  }
}

