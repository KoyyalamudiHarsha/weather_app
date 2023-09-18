import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/data/weather_repository.dart';
import 'package:weather_app/domain/forecast/forecast_data.dart';
import 'package:weather_app/domain/weather/weather_data.dart';

final cityProvider = StateProvider<String>((ref) {
  return 'Hyderabad';
});

final currentWeatherProvider =
FutureProvider.autoDispose<WeatherData>((ref) async {
  final city = ref.watch(cityProvider);
  final weather =
  await ref.watch(weatherRepositoryProvider).getWeather(city: city);
  return WeatherData.from(weather);
});

final weeklyWeatherProvider =
FutureProvider.autoDispose<ForecastData>((ref) async {
  final city = ref.watch(cityProvider);
  final forecast =
  await ref.watch(weatherRepositoryProvider).getForecast(city: city);
  return ForecastData.from(forecast);
});