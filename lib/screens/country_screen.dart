import 'package:covid_19_tracker/screens/cases_screen.dart';
import 'package:covid_19_tracker/services/location.dart';
import 'file:///E:/AndroidProjects/covid_19_tracker/lib/src/styles_constants.dart';
import 'package:flutter/material.dart';
import 'package:covid_19_tracker/services/country_List.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class CountryScreen extends StatefulWidget {
  static const id='CountryScreen';

  @override
  _CountryScreenState createState() => _CountryScreenState();
}

class _CountryScreenState extends State<CountryScreen> {
bool isLoading=false;
String selectedCountry='egypt';

final spinKit = SpinKitCircle(
  color: Colors.white,
  size: 50.0,

);

List<Text> getPickerItems()
{

  List<Text>pickerItems=[];

  for(String country in countryList )
    {

      pickerItems.add(Text(country,
          style: TextStyle(color: textColor,fontSize: 30,fontFamily:'Changa')));

    }
  return pickerItems;

}

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }





  void getLocationData()async

  {
    LocationService  service= new LocationService();
    var dataNow= await service.getLocationCasesNow(selectedCountry);

    isLoading=true;

    int   todayCases=dataNow['todayCases'];

    if(todayCases!=0) {
      Navigator.push(context, MaterialPageRoute(builder:
          (context) => CasesScreen(locationStatues: dataNow,)));
    }
    else if(todayCases==0)
      {
        var dataOld= await service.getLocationCasesOld(selectedCountry);
        Navigator.push(context, MaterialPageRoute(builder:
            (context) => CasesScreen(locationStatues: dataOld,)));


      }


    isLoading=false;


  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body:



      isLoading

          ? Center(
            child: Container(

        child: SpinKitRipple(

            color: Colors.red,
            size: MediaQuery.of(context).size.width,

        ),
      ),
          )


      : Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[



          Image.asset('images/virus.png',height: 150,width: 150,),

          SizedBox(height: 40,),

          Text('Select Country To Find',style: TextStyle(fontSize: 18,
              fontFamily:'Changa',color: Colors.yellow.shade600
              ,fontWeight: FontWeight.w400),),

          Container(

            decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(40)),
            color: upperColor.withOpacity(1)
            ),

           // margin:EdgeInsets.symmetric(horizontal: 40),

            padding: EdgeInsets.all(30),

            margin: EdgeInsets.only(bottom: 20, right: 30,left: 30),


            child: Container(

             // margin:EdgeInsets.symmetric(horizontal: 30),

              decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(0)),
                color: upperColor.withOpacity(0.7),

              ),
              height: 300,


              child:CupertinoPicker(


                backgroundColor: upperColor.withOpacity(0.35),
                squeeze:1.3 ,
                looping:true ,
                itemExtent:50 ,
                onSelectedItemChanged:(selectedItem){

                  setState(() {
                    selectedCountry=countryList[selectedItem];

                  });

                } ,
                children: getPickerItems() ,
              ) ,



            ),
          ),

          Card(


            elevation: 7,
            color: Colors.black.withOpacity(0),
            child: InkWell(

              splashColor: Colors.yellow.shade600,

              onTap: (){
                getLocationData();

                setState(() {
                  isLoading=true;
                });

              },



              child: Text('Select',style: TextStyle
                (fontSize: 30,color: Colors.white,fontWeight: FontWeight.bold,
                  letterSpacing: 1.8,decoration: TextDecoration.underline
              )
                ,
              ),
            ),
          ),











        ],
      ),

    );
  }
}




//
//DropdownButton<String>(
//value: selectedCountry,
//
//items:  buildDropDownItem(),
//
//onChanged:(value)
//{
//setState(() {
//selectedCountry=value;
//});
//},
//
//)

//
//List <DropdownMenuItem> buildDropDownItem()
//{
//
//  List<DropdownMenuItem<String>>dropDownItems=[];
//
//  for(String country in countryList)
//  {
//    var newItem=DropdownMenuItem(
//
//      child: Text(country,style: TextStyle(fontSize: 30,color:textColor,fontWeight: FontWeight.w400,fontFamily: 'Changa' ),) ,
//      value:country ,
//    );
//
//    dropDownItems.add(newItem);
//  }
//  return dropDownItems;
//}
