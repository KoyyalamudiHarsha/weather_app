import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/permissions/permissions_handler.dart';
import 'package:weather_app/presentation/weather_page.dart';
import 'presentation/current_weather.dart';
import 'presentation/search_city_weather.dart';


void main() {
  runApp(
    const ProviderScope(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ButtonsRoute(),
      ),
    ),
  );
}


class ButtonsRoute extends StatelessWidget {
  const ButtonsRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text('Weather Forecast'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const WeatherPage(city: 'Hyderabad')),
                );
              },
            ),
            SizedBox(height: 16),
            ElevatedButton(
              child: const Text('Search City Temp'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SearchCityWeather()),
                );
              },
            ),
            SizedBox(height: 16),
            ElevatedButton(
              child: const Text('Current Loc Temp'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CurrentWeather()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
