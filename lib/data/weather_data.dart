import '../models/weather_model.dart';

class WeatherData {
  static List<WeatherModel> getDummyWeatherData() {
    return [
      WeatherModel(
        cityName: 'Jakarta - Your Location',
        temperature: 32.0,
        condition: 'Sunny',
        description: 'Clear sky with bright sunshine',
        humidity: 65,
        windSpeed: 12.5,
      ),
      WeatherModel(
        cityName: 'Bandung',
        temperature: 24.0,
        condition: 'Cloudy',
        description: 'Partly cloudy with cool breeze',
        humidity: 78,
        windSpeed: 8.3,
      ),
      WeatherModel(
        cityName: 'Surabaya',
        temperature: 30.0,
        condition: 'Partly Cloudy',
        description: 'Mix of sun and clouds',
        humidity: 72,
        windSpeed: 15.2,
      ),
      WeatherModel(
        cityName: 'Medan',
        temperature: 28.0,
        condition: 'Rainy',
        description: 'Light rain with overcast sky',
        humidity: 85,
        windSpeed: 10.7,
      ),
      WeatherModel(
        cityName: 'Yogyakarta',
        temperature: 26.0,
        condition: 'Cloudy',
        description: 'Overcast with mild temperature',
        humidity: 70,
        windSpeed: 6.8,
      ),
      WeatherModel(
        cityName: 'Makassar',
        temperature: 31.0,
        condition: 'Sunny',
        description: 'Hot and sunny weather',
        humidity: 60,
        windSpeed: 14.1,
      ),
    ];
  }
}