
class Weather {
  num temp;
  num feelsLike;
  num humidity;
  num high;
  num low;

  Weather(
      {required this.temp,
      required this.feelsLike,
      required this.humidity,
      required this.high,
      required this.low});

  factory Weather.fromJson(Map<String, dynamic> json){
    return Weather(
        temp: json['main']['temp'],
        feelsLike: json['main']['feels_like'],
        humidity: json['main']['humidity'],
        high: json['main']["temp_max"] ,
        low: json['main']['temp_min']);
  }

}
