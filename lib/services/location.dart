import 'package:covid_19_tracker/services/networking.dart';

class LocationService {

  String _key='now';
  Future getLocationCasesNow(String country) async
  {
    NetworkHelper networkHelper = new NetworkHelper(

        'https://corona.lmao.ninja/v2/countries/$country?$_key=true&strict=true'

    );
    var data = await networkHelper.getData();
          return data;
  }

  Future getLocationCasesOld(String country) async
  {

    _key='yesterday';
    NetworkHelper networkHelper = new NetworkHelper(

        'https://corona.lmao.ninja/v2/countries/$country?$_key=true&strict=true'

    );
    var data = await networkHelper.getData();

    return data;
  }




}//https://api.thevirustracker.com/free-api?countryTotal=eg
//https://api.thevirustracker.com/free-api?countryTotals=ALL6