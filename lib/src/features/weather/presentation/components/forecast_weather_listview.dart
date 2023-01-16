import 'package:flutter/material.dart';
import 'package:weather_forecast_app/src/constants/constants_exports.dart';
import 'package:weather_forecast_app/src/utils/utils_exports.dart';

import '../../data/models/forecast_weather_data.dart';
import 'forecast_weather_widget.dart';

class ForecastWeatherListview extends StatelessWidget {
  const ForecastWeatherListview({
    Key? key,
    required this.forecastWeatherData,
  }) : super(key: key);

  final ForecastWeatherData forecastWeatherData;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSizes.twenty,
          vertical: AppSizes.twenty,
        ),
        itemCount: 5,
        primary: false,
        shrinkWrap: true,
        cacheExtent: AppSizes.ten,
        addAutomaticKeepAlives: false,
        addRepaintBoundaries: false,
        physics: const NeverScrollableScrollPhysics(),
        separatorBuilder: (_, __) => sizedBox2,
        itemBuilder: (_, index) {
          final forecastDays = [0, 8, 16, 24, 32];
          final data = [
            for (var i in forecastDays) forecastWeatherData.list[i]
          ];
          return ForecastWeatherWidget(forecastWeatherdata: data[index]);
        },
      ),
    );
  }
}
