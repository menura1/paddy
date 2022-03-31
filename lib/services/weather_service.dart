import 'package:http/http.dart' as http;
import 'package:paddy/global/api_keys.dart';

class WeatherService{

  getCurrentWeather(){
    var response = http.get(
        Uri.parse('https://api.openweathermap.org/data/2.5/weather?lat={lat}&lon={lon}&appid=$ApiKeys.weatherApiKey')
    );
  }

}