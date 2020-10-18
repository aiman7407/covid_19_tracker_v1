import 'package:flutter/material.dart';
import 'package:covid_19_tracker/screens/cases_screen.dart';
import 'package:covid_19_tracker/screens/country_screen.dart';


class AppRoute extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(


      home: CountryScreen(),
      routes: {
        CountryScreen.id:(context)=>CountryScreen(),
        CasesScreen.id:(context)=>CasesScreen(),
      },
    );
  }
}
