import 'package:mockito/annotations.dart';
import 'package:weather_forecast_app/src/common/common_exports.dart';
import 'package:weather_forecast_app/src/features/weather/data/api/current_weather/entities/temp_params.dart';
import 'package:weather_forecast_app/src/features/weather/data/api/current_weather/entities/weather_info.dart';
import 'package:weather_forecast_app/src/features/weather/data/api/current_weather/entities/wind_param.dart';
import 'package:weather_forecast_app/src/features/weather/data/api/current_weather/response/weather_response.dart';
import 'package:weather_forecast_app/src/features/weather/data/api/forecast_weather/response/forecast_weather_response.dart';
import 'package:weather_forecast_app/src/features/weather/data/api/weather_api_manager.dart';
import 'package:weather_forecast_app/src/features/weather/data/data_exports.dart';

@GenerateMocks([WeatherApiManager, WeatherRepositoryImpl, AppDatabaseManager])

const expectedWeatherFromJson = WeatherResponse(
  main: TempParams(
    temp: 298.48,
    temp_min: 297.56,
    temp_max: 300.05,
    humidity: 64,
  ),
  weather: [
    WeatherInfo(
      id: 501,
      main: 'Rain',
      description: 'moderate rain',
      icon: '10d',
    )
  ],
  wind: WindParam(speed: 0.62),
  dt: 1661870592,
);

const expectedForecastWeatherFromJson = ForecastWeatherResponse(
  list: [expectedWeatherFromJson],
);

const mockWeatherJson = {
  "coord": {"lon": 10.99, "lat": 44.34},
  "weather": [
    {"id": 501, "main": "Rain", "description": "moderate rain", "icon": "10d"}
  ],
  "base": "stations",
  "main": {
    "temp": 298.48,
    "feels_like": 298.74,
    "temp_min": 297.56,
    "temp_max": 300.05,
    "pressure": 1015,
    "humidity": 64,
    "sea_level": 1015,
    "grnd_level": 933
  },
  "visibility": 10000,
  "wind": {"speed": 0.62, "deg": 349, "gust": 1.18},
  "rain": {"1h": 3.16},
  "clouds": {"all": 100},
  "dt": 1661870592,
  "sys": {
    "type": 2,
    "id": 2075663,
    "country": "IT",
    "sunrise": 1661834187,
    "sunset": 1661882248
  },
  "timezone": 7200,
  "id": 3163858,
  "name": "Zocca",
  "cod": 200
};

const mockForecastWeatherJson = {
  "cod": "200",
  "message": 0,
  "cnt": 40,
  "list": [mockWeatherJson],
  "city": {
    "id": 3163858,
    "name": "Zocca",
    "coord": {"lat": 44.34, "lon": 10.99},
    "country": "IT",
    "population": 4593,
    "timezone": 7200,
    "sunrise": 1661834187,
    "sunset": 1661882248
  }
};
