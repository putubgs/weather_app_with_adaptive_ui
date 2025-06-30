import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_constants.dart';
import '../data/weather_data.dart';
import '../models/weather_model.dart';
import '../widgets/adaptive_weather_list.dart';
import '../screens/current_weather.dart';

class WeatherHomeScreen extends StatefulWidget {
  const WeatherHomeScreen({super.key});

  @override
  State<WeatherHomeScreen> createState() => _WeatherHomeScreenState();
}

class _WeatherHomeScreenState extends State<WeatherHomeScreen> {
  List<WeatherModel> weatherList = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadWeatherData();
  }

  Future<void> _loadWeatherData() async {
    await Future.delayed(const Duration(milliseconds: 800));
    setState(() {
      weatherList = WeatherData.getDummyWeatherData();
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: isLoading
          ? _buildLoadingWidget()
          : _buildWeatherContent(context),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    final isLargeScreen =
        MediaQuery.of(context).size.width > AppConstants.mobileBreakpoint;

    return AppBar(
      title: Text(
        'Weather Lists',
        style: TextStyle(
          fontSize:
              isLargeScreen ? AppConstants.fontXLarge : AppConstants.fontLarge,
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.refresh),
          onPressed: () {
            setState(() {
              isLoading = true;
            });
            _loadWeatherData();
          },
        ),
        const SizedBox(width: AppConstants.paddingSmall),
      ],
    );
  }

  Widget _buildLoadingWidget() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary),
          ),
          SizedBox(height: AppConstants.paddingMedium),
          Text(
            'Loading weather data...',
            style: TextStyle(
              fontSize: AppConstants.fontMedium,
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWeatherContent(BuildContext context) {
    if (weatherList.isEmpty) {
      return _buildEmptyState();
    }

    return AdaptiveWeatherList(
      weatherList: weatherList,
      onTap: (WeatherModel selectedWeather) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) =>
                CurrentWeatherScreen(weather: selectedWeather),
          ),
        );
      },
    );
  }

  Widget _buildEmptyState() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('🌤️', style: TextStyle(fontSize: 64)),
          SizedBox(height: AppConstants.paddingMedium),
          Text(
            'No weather data available',
            style: TextStyle(
              fontSize: AppConstants.fontLarge,
              color: AppColors.textPrimary,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: AppConstants.paddingSmall),
          Text(
            'Pull to refresh to load weather data',
            style: TextStyle(
              fontSize: AppConstants.fontMedium,
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}