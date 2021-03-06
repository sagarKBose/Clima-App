import 'package:clima_app/services/location.dart';

import 'networking.dart';

const apiKey = '79de5817a4d223b536ce61a0f630a4b4';
const openWeatherURL = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    try {
      //added try and catch
      await location.getCurrentLocation().timeout(
          Duration(seconds: 5)); //timeout throws exception  //remove this one
      NetworkHelper networkHelper = NetworkHelper(
          '$openWeatherURL?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');

      var weatherData = await networkHelper.getData();
      return weatherData;
    } catch (e) {
      print(e);
      return null;
    }
  }

  // Future<dynamic> getLocationWeather() async {
  //   Location location = Location();
  //   await location.getCurrentLocation();
  //   var url = Uri.parse(
  //       '$openWeatherURL?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');
  //   NetworkHelper networkHelper = NetworkHelper(url);
  //   var weatherData = await networkHelper.getData();
  //   return weatherData;
  // }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '๐ฉ';
    } else if (condition < 400) {
      return '๐ง';
    } else if (condition < 600) {
      return 'โ๏ธ';
    } else if (condition < 700) {
      return 'โ๏ธ';
    } else if (condition < 800) {
      return '๐ซ';
    } else if (condition == 800) {
      return 'โ๏ธ';
    } else if (condition <= 804) {
      return 'โ๏ธ';
    } else {
      return '๐คทโ';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s ๐ฆ time';
    } else if (temp > 20) {
      return 'Time for shorts and ๐';
    } else if (temp < 10) {
      return 'You\'ll need ๐งฃ and ๐งค';
    } else {
      return 'Bring a ๐งฅ just in case';
    }
  }
}
