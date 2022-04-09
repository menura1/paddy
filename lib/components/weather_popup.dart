import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:paddy/models/weather_model.dart';
import 'package:paddy/services/weather_service.dart';

class WeatherPopup extends StatefulWidget {
  const WeatherPopup({Key? key}) : super(key: key);

  @override
  _WeatherPopupState createState() => _WeatherPopupState();
}

class _WeatherPopupState extends State<WeatherPopup> {

  Weather currentWeather = WeatherService.currentWeather!;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20)
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Check how current weather affects your plants.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16
              ),),
            const SizedBox(height: 15,),
            Text('Temperature - ${currentWeather.temp.toString().substring(0,5)} °C'),
            const SizedBox(height: 5,),
            Text('Humidity - ${currentWeather.humidity}%'),
            const SizedBox(height: 5,),
            Text('Feels like - ${currentWeather.feelsLike.toString().substring(0,5)} °C'),
            const SizedBox(height: 5,),
            Text('High - ${currentWeather.high.toString().substring(0,5)} °C'),
            const SizedBox(height: 5,),
            Text('Low - ${currentWeather.low.toString().substring(0,5)} °C'),
            const SizedBox(height: 15,),
            Center(
              child: GestureDetector(
                onTap: (){
                  Navigator.of(context).pop();
                },
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 7),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xff0F00FF)
                  ),
                  child: const Text('Close', style: TextStyle(color: Colors.white),),
                ),
              ),
            )

          ],
        ),
      ),
    );
  }
}
