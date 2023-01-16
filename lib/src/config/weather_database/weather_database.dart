import 'package:hive/hive.dart';
import 'package:weather_forecast_app/src/constants/constants_exports.dart';

class WeatherDatabase {
  static late final WeatherDatabase _database;
  final Box<dynamic> _box;

  WeatherDatabase._(this._box);

  static Future<WeatherDatabase> init() async {
    final box = await Hive.openBox<dynamic>(AppStrings.databaseBox);
    _database = WeatherDatabase._(box);
    return _database;
  }

  static WeatherDatabase get instance => _database;

  T getValue<T>(key, {required T defaultValue}) =>
      _box.get(key, defaultValue: defaultValue) as T;

  Future<void> setValue<T>(key, T value) => _box.put(key, value);

  Future<void> deleteValue<T>(key) => _box.delete(key);
}
