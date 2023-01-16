import '../api/forecast_weather/response/forecast_weather_response.dart';
import 'weather_data.dart';

class ForecastWeatherData {
  const ForecastWeatherData({
    required this.list,
  });

  final List<WeatherData> list;

  factory ForecastWeatherData.from(ForecastWeatherResponse forecastWeatherResponse) =>
      ForecastWeatherData(
        list: forecastWeatherResponse.list
            .map((data) => WeatherData.from(data))
            .toList(),
      );
}
