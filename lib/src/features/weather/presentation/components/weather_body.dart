import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:weather_forecast_app/src/common/widgets/async_value_widget.dart';
import 'package:weather_forecast_app/src/constants/constants_exports.dart';
import 'package:weather_forecast_app/src/utils/utils_exports.dart';

import '../../data/models/weather_data.dart';
import '../controllers/weather_controller.dart';
import 'current_weather_section.dart';
import 'favorite_button.dart';
import 'favorite_location/location_widget.dart';
import 'forecast_weather_section.dart';
import 'search/search_button.dart';

class WeatherBody extends ConsumerWidget {
  const WeatherBody({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weatherDataValue = ref.watch(currentWeatherControllerProvider);

    return AsyncValueWidget<WeatherData>(
      value: weatherDataValue,
      data: (weatherData) => Stack(
        children: [
          Column(
            children: [
              CurrentWeatherSection(weatherData: weatherData),
              ForecastWeatherSection(
                weatherConditionCode: weatherData.weatherConditionCode,
              ),
            ],
          ),
          Positioned(
            top: SizeConfig.blockSizeVertical * AppSizes.eight,
            left: SizeConfig.blockSizeHorizontal * AppSizes.four,
            child: LocationWidget(
              weatherConditionCode: weatherData.weatherConditionCode,
            ),
          ),
          Positioned(
            top: SizeConfig.blockSizeVertical * AppSizes.eight,
            right: SizeConfig.blockSizeHorizontal * AppSizes.twenty,
            child: SearchButton(
              weatherConditionCode: weatherData.weatherConditionCode,
            ),
          ),
          Positioned(
            top: SizeConfig.blockSizeVertical * AppSizes.eight,
            right: SizeConfig.blockSizeHorizontal * AppSizes.four,
            child: const FavoriteButton(),
          )
        ],
      ),
    );
  }
}
