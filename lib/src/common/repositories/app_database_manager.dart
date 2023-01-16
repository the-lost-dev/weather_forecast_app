import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_forecast_app/src/constants/constants_exports.dart';

import '../../config/weather_database/weather_database.dart';

final appDatabaseMagerProvider = Provider<AppDatabaseManager>(
  (ref) => AppDatabaseManager(),
);

class AppDatabaseManager {
  final WeatherDatabase _database = WeatherDatabase.instance;

  void saveFavoriteCity(List<String> favoriteCities) {
    _database.setValue(AppStrings.favoriteCitiesKey, favoriteCities);
  }

  List<String>? getFavoriteCities() {
    return _database.getValue(
      AppStrings.favoriteCitiesKey,
      defaultValue: null,
    );
  }

  void clearSavedCities() {
    _database.deleteValue(AppStrings.favoriteCitiesKey);
  }
}
