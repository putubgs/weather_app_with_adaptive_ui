import 'package:flutter/material.dart';
import '../constants/app_constants.dart';
import '../models/weather_model.dart';

class CurrentWeatherScreen extends StatelessWidget {
  final WeatherModel weather;

  const CurrentWeatherScreen({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final isLargeScreen =
        MediaQuery.of(context).size.width > AppConstants.mobileBreakpoint;

    final double iconSize = isLargeScreen ? 120.0 : 90.0;
    final double cityFontSize = isLargeScreen
        ? AppConstants.fontXXLarge + 6
        : AppConstants.fontXLarge + 4;
    final double tempFontSize = isLargeScreen
        ? AppConstants.fontXXLarge + 12
        : AppConstants.fontXXLarge + 6;
    final double descFontSize = isLargeScreen
        ? AppConstants.fontMedium + 2
        : AppConstants.fontSmall;
    final double detailLabelFontSize = AppConstants.fontSmall;
    final double detailValueFontSize = AppConstants.fontMedium;
    final double paddingSmall = AppConstants.paddingSmall;
    final double paddingMedium = AppConstants.paddingMedium;
    final double paddingLarge = AppConstants.paddingLarge;

    return Scaffold(
      appBar: _buildAppBar(context, isLargeScreen, colorScheme.primary),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(isLargeScreen ? paddingLarge : paddingMedium),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(weather.weatherIcon, style: TextStyle(fontSize: iconSize)),
              SizedBox(height: paddingSmall),
              Text(
                weather.cityName,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: cityFontSize,
                  fontWeight: FontWeight.bold,
                  color:
                      theme.textTheme.titleLarge?.color ??
                      colorScheme.onSurface,
                ),
              ),
              SizedBox(height: paddingSmall),
              Text(
                weather.formattedTemperature,
                style: TextStyle(
                  fontSize: tempFontSize,
                  fontWeight: FontWeight.w600,
                  color: colorScheme.primary,
                ),
              ),
              SizedBox(height: paddingSmall),
              Text(
                weather.description,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: descFontSize,
                  color: theme.textTheme.bodyMedium?.color ?? Colors.grey[600],
                ),
              ),
              SizedBox(
                height: isLargeScreen ? paddingMedium * 1.5 : paddingMedium,
              ),

              _buildWeatherDetails(
                context,
                colorScheme.primary,
                detailLabelFontSize,
                detailValueFontSize,
                paddingSmall,
                isLargeScreen,
              ),
            ],
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(
    BuildContext context,
    bool isLarge,
    Color primaryColor,
  ) {
    return AppBar(
      title: Text(
        'Current Weather',
        style: TextStyle(
          fontSize: isLarge ? AppConstants.fontXLarge : AppConstants.fontLarge,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
    );
  }

  Widget _buildWeatherDetails(
    BuildContext context,
    Color primaryColor,
    double detailLabelFontSize,
    double detailValueFontSize,
    double paddingSmall,
    bool isLargeScreen,
  ) {
    if (isLargeScreen) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildDetailItem(
            icon: '💧',
            label: 'Humidity',
            value: '${weather.humidity}%',
            primaryColor: primaryColor,
            detailLabelFontSize: detailLabelFontSize,
            detailValueFontSize: detailValueFontSize,
            paddingSmall: paddingSmall,
          ),
          _buildDetailItem(
            icon: '💨',
            label: 'Wind',
            value: '${weather.windSpeed} km/h',
            primaryColor: primaryColor,
            detailLabelFontSize: detailLabelFontSize,
            detailValueFontSize: detailValueFontSize,
            paddingSmall: paddingSmall,
          ),
        ],
      );
    } else {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: _buildDetailItem(
            icon: '💧',
            label: 'Humidity',
            value: 'Humidity: ${weather.humidity}%',
            primaryColor: primaryColor,
            detailLabelFontSize: detailLabelFontSize,
            detailValueFontSize: detailValueFontSize,
            paddingSmall: paddingSmall,
          ),
        ),
        Expanded(
          child: _buildDetailItem(
            icon: '💨',
            label: 'Wind',
            value: '${weather.windSpeed} km/h',
            primaryColor: primaryColor,
            detailLabelFontSize: detailLabelFontSize,
            detailValueFontSize: detailValueFontSize,
            paddingSmall: paddingSmall,
          ),
        ),
      ],
    );
    }
  }

  Widget _buildDetailItem({
    required String icon,
    required String label,
    required String value,
    required Color primaryColor,
    required double detailLabelFontSize,
    required double detailValueFontSize,
    required double paddingSmall,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8.0,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                icon,
                style: TextStyle(fontSize: detailLabelFontSize + 4),
              ),
              SizedBox(width: 4),
              Text(
                label,
                style: TextStyle(
                  fontSize: detailLabelFontSize,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
          SizedBox(height: paddingSmall),
          Text(
            value,
            style: TextStyle(
              fontSize: detailValueFontSize,
              fontWeight: FontWeight.w600,
              color: primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
