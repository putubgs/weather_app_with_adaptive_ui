import 'package:flutter/material.dart';
import '../constants/app_constants.dart';
import '../models/weather_model.dart';
import 'weather_card.dart';

class AdaptiveWeatherList extends StatelessWidget {
  final List<WeatherModel> weatherList;
  final ValueChanged<WeatherModel> onTap;

  const AdaptiveWeatherList({
    super.key,
    required this.weatherList,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isLargeScreen =
            constraints.maxWidth > AppConstants.mobileBreakpoint;

        if (isLargeScreen) {
          return _buildGridView(context);
        } else {
          return _buildListView(context);
        }
      },
    );
  }

  Widget _buildListView(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(AppConstants.paddingMedium),
      itemCount: weatherList.length,
      separatorBuilder: (context, index) =>
          const SizedBox(height: AppConstants.paddingMedium),
      itemBuilder: (context, index) {
        final w = weatherList[index];
        return GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => onTap(w),
          child: WeatherCard(weather: w, isLargeScreen: false),
        );
      },
    );
  }

  Widget _buildGridView(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    int crossAxisCount = 2;
    if (screenWidth > AppConstants.tabletBreakpoint) {
      crossAxisCount = 3;
    }

    return GridView.builder(
      padding: const EdgeInsets.all(AppConstants.paddingLarge),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        childAspectRatio: 0.85,
        crossAxisSpacing: AppConstants.paddingMedium,
        mainAxisSpacing: AppConstants.paddingMedium,
      ),
      itemCount: weatherList.length,
      itemBuilder: (context, index) {
        final w = weatherList[index];
        return GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => onTap(w),
          child: WeatherCard(weather: w, isLargeScreen: true),
        );
      },
    );
  }
}
