import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_forecast_app/src/common/common_exports.dart';
import 'package:weather_forecast_app/src/constants/constants_exports.dart';
import 'package:weather_forecast_app/src/features/weather/data/models/forecast_weather_data.dart';
import 'package:weather_forecast_app/src/utils/utils_exports.dart';

import '../controllers/forecast_weather_controller.dart';
import 'forecast_weather_listview.dart';

class ForecastWeatherSection extends ConsumerWidget {
  const ForecastWeatherSection({
    Key? key,
    required this.weatherConditionCode,
  }) : super(key: key);

  final int weatherConditionCode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final forecastDataValue = ref.watch(forecastWeatherControllerProvider);
    return AsyncValueWidget<ForecastWeatherData>(
      value: forecastDataValue,
      data: (forecastWeatherData) => Expanded(
        child: Container(
          color: weatherConditionColor(weatherConditionCode),
          child: Column(
            children: [
              const Divider(
                color: AppColors.whiteColor,
                thickness: AppSizes.two,
              ),
              ForecastWeatherListview(forecastWeatherData: forecastWeatherData),
            ],
          ),
        ),
      ),
    );
  }
}
