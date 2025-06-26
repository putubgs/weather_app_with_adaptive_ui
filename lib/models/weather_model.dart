class WeatherModel {
  final String cityName;
  final double temperature;
  final String condition;
  final String description;
  final int humidity;
  final double windSpeed;

  WeatherModel({
    required this.cityName,
    required this.temperature,
    required this.condition,
    required this.description,
    required this.humidity,
    required this.windSpeed,
  });

  String get formattedTemperature => '${temperature.toInt()}°C';
  
  String get weatherIcon {
    switch (condition.toLowerCase()) {
      case 'sunny':
        return '☀️';
      case 'cloudy':
        return '☁️';
      case 'rainy':
        return '🌧️';
      case 'thunderstorm':
        return '⛈️';
      case 'snowy':
        return '❄️';
      case 'partly cloudy':
        return '⛅';
      default:
        return '🌤️';
    }
  }
}