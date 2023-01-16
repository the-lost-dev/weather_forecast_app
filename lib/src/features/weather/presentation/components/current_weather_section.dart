import 'package:flutter/material.dart';
import 'package:weather_forecast_app/src/constants/constants_exports.dart';
import 'package:weather_forecast_app/src/utils/utils_exports.dart';

import '../../data/models/weather_data.dart';
import 'temp_text.dart';

class CurrentWeatherSection extends StatelessWidget {
  const CurrentWeatherSection({
    Key? key,
    required this.weatherData,
  }) : super(key: key);

  final WeatherData weatherData;

  @override
  Widget build(BuildContext context) {
    final temp = weatherData.temp.celsius.toInt().toString();
    final maxTemp = weatherData.maxTemp.celsius.toInt().toString();
    final minTemp = weatherData.minTemp.celsius.toInt().toString();

    return SizedBox(
      height: SizeConfig.blockSizeVertical * AppSizes.sixty,
      child: Column(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    weatherConditionImage(
                      weatherData.weatherConditionCode,
                    ),
                  ),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "$temp\u00B0",
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  Text(
                    weatherData.description.toUpperCase(),
                    style: Theme.of(context).textTheme.headline2,
                  ),
                ],
              ),
            ),
          ),
          Container(
            color: weatherConditionColor(weatherData.weatherConditionCode),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSizes.twenty,
                vertical: AppSizes.ten,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TempText(
                    temp: "$minTemp\u00B0",
                    tempRangeText: 'min',
                  ),
                  TempText(
                    temp: "$temp\u00B0",
                    tempRangeText: 'current',
                  ),
                  TempText(
                    temp: "$maxTemp\u00B0",
                    tempRangeText: 'max',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
