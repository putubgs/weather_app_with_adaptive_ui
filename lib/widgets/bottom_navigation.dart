import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../data/weather_data.dart';
import '../models/weather_model.dart';
import '../screens/weather_home_screen.dart';
import '../screens/current_weather.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 1;

  int get selectedIndex => _selectedIndex;

  late final WeatherModel _defaultWeather;

  @override
  void initState() {
    super.initState();
    _defaultWeather = WeatherData.getDummyWeatherData().first;
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final pages = <Widget>[
      const WeatherHomeScreen(),
      CurrentWeatherScreen(weather: _defaultWeather),
      const Center(child: Text('Index 2: Profile Page')),
    ];

    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.cloudy_snowing),
            label: 'Weather',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: AppColors.primary,
        onTap: _onItemTapped,
      ),
    );
  }
}
