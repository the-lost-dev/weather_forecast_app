import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_forecast_app/src/config/config_exports.dart';

import '../../data/data_exports.dart';
import '../../data/models/forecast_weather_data.dart';
import '../../data/repository/weather_repository.dart';
import '../components/search/city_search_box.dart';

class ForecastWeatherController
    extends StateNotifier<AsyncValue<ForecastWeatherData>> {
  ForecastWeatherController({
    required this.ref,
  }) : super(const AsyncValue.loading()) {
    getForecastWeather(city: ref.read(cityProvider));
  }

  final Ref ref;

  Future<void> getForecastWeather({required String city}) async {
    state = const AsyncValue.loading();

    final WeatherRepository weatherRepository = getIt<WeatherRepositoryImpl>();

    final String city = ref.read(cityProvider);

    final response = await weatherRepository.getForecastWeatherData(city: city);

    response.fold(
      (failure) => state = AsyncValue.error(
        failure.message,
        StackTrace.current,
      ),
      (result) => state = AsyncValue.data(ForecastWeatherData.from(result)),
    );
  }
}

final forecastWeatherControllerProvider = StateNotifierProvider.autoDispose<
    ForecastWeatherController, AsyncValue<ForecastWeatherData>>(
  (ref) => ForecastWeatherController(ref: ref),
);
