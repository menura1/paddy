import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:paddy/global/api_keys.dart';
import 'package:paddy/services/location_service.dart';

class WeatherService{

  Future<Map> getCurrentWeather() async{
    var locationService = LocationService();
    var currentLocation = await locationService.getLocation();

    late Map weather;

    var lat = currentLocation?.latitude;
    var long = currentLocation?.longitude;
    var response = await http.get(
        Uri.parse('https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$long&appid=${ApiKeys.weatherApiKey}')
    ).then((value){
      print(value.body);
      weather = jsonDecode(value.body);
      print(weather['main']['temp']);
      print(weather['main']['humidity']);
    });
    return {
      'temp': weather['main']['temp'],
      'humidity': weather['main']['humidity']
    };
  }

}