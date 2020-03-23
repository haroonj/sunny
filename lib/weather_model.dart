import 'location.dart';
import 'Networking.dart';

const apiKey = 'c004b1ea9fff828e93a826c52d29a2b0';

class WeatherModel {
  var lat;
  var lon;

  Future<dynamic> getCityLocationWeather(String city)async{
    var url ='https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey&units=metric';
    NetworkHelper networkHelper = NetworkHelper(
        url:url);

    var data = await networkHelper.getData();
    return data;
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentPosition();
    lat = location.latitude;
    lon = location.longitude;

    NetworkHelper networkHelper = NetworkHelper(
        url:
        'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$apiKey&units=metric');

    var data = await networkHelper.getData();
    return data;
  }

  String getWeatherIcon(var condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(var temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
