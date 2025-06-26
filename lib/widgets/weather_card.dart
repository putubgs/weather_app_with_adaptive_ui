import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_constants.dart';
import '../models/weather_model.dart';

class WeatherCard extends StatelessWidget {
  final WeatherModel weather;
  final bool isLargeScreen;

  const WeatherCard({
    super.key,
    required this.weather,
    this.isLargeScreen = false,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: AppConstants.cardElevation,
      shadowColor: AppColors.cardShadow,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppConstants.cardBorderRadius),
      ),
      child: Container(
        padding: EdgeInsets.all(
          isLargeScreen
              ? AppConstants.paddingLarge
              : AppConstants.paddingMedium,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppConstants.cardBorderRadius),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              AppColors.surface,
              AppColors.surface.withValues(alpha: 0.9),
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            const SizedBox(height: AppConstants.paddingSmall),
            _buildTemperature(),
            const SizedBox(height: AppConstants.paddingSmall),
            _buildDescription(),
            if (isLargeScreen) ...[
              const SizedBox(height: AppConstants.paddingMedium),
              _buildWeatherDetails(),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            weather.cityName,
            style: TextStyle(
              fontSize: isLargeScreen
                  ? AppConstants.fontXLarge
                  : AppConstants.fontLarge,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Text(
          weather.weatherIcon,
          style: TextStyle(fontSize: isLargeScreen ? 32 : 24),
        ),
      ],
    );
  }

  Widget _buildTemperature() {
    return Row(
      children: [
        Text(
          weather.formattedTemperature,
          style: TextStyle(
            fontSize: isLargeScreen
                ? AppConstants.fontXXLarge + 4
                : AppConstants.fontXLarge + 2,
            fontWeight: FontWeight.w600,
            color: AppColors.primary,
          ),
        ),
        const SizedBox(width: AppConstants.paddingSmall),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: AppConstants.paddingSmall,
            vertical: 4,
          ),
          decoration: BoxDecoration(
            color: AppColors.primary.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            weather.condition,
            style: const TextStyle(
              fontSize: AppConstants.fontSmall,
              color: AppColors.primary,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDescription() {
    return Text(
      weather.description,
      style: TextStyle(
        fontSize: isLargeScreen
            ? AppConstants.fontMedium
            : AppConstants.fontSmall,
        color: AppColors.textSecondary,
      ),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildWeatherDetails() {
    return Row(
      children: [
        Expanded(
          child: _buildDetailItem(
            icon: '💧',
            label: 'Humidity',
            value: '${weather.humidity}%',
          ),
        ),
        Expanded(
          child: _buildDetailItem(
            icon: '💨',
            label: 'Wind',
            value: '${weather.windSpeed} km/h',
          ),
        ),
      ],
    );
  }

  Widget _buildDetailItem({
    required String icon,
    required String label,
    required String value,
  }) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(icon, style: const TextStyle(fontSize: 16)),
            const SizedBox(width: 4),
            Text(
              label,
              style: const TextStyle(
                fontSize: AppConstants.fontSmall,
                color: AppColors.textSecondary,
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            fontSize: AppConstants.fontMedium,
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
        ),
      ],
    );
  }
}
