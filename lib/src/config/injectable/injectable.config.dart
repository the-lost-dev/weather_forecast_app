// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:weather_forecast_app/src/features/weather/data/api/weather_api_manager.dart'
    as _i3;
import 'package:weather_forecast_app/src/features/weather/data/repository/weather_repository_impl.dart'
    as _i4;

/// ignore_for_file: unnecessary_lambdas
/// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of main-scope dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  gh.lazySingleton<_i3.WeatherApiManager>(() => _i3.WeatherApiManager.create());
  gh.lazySingleton<_i4.WeatherRepositoryImpl>(
      () => _i4.WeatherRepositoryImpl(gh<_i3.WeatherApiManager>()));
  return getIt;
}
