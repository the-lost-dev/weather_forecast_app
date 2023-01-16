import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_forecast_app/src/utils/utils_exports.dart';

import '../../data/models/weather_data.dart';

class ForecastWeatherWidget extends StatelessWidget {
  const ForecastWeatherWidget({
    Key? key,
    required this.forecastWeatherdata,
  }) : super(key: key);

  final WeatherData forecastWeatherdata;

  @override
  Widget build(BuildContext context) {
    final temp = forecastWeatherdata.temp.celsius.toInt().toString();

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          DateFormat.E().format(forecastWeatherdata.date),
          style: Theme.of(context).textTheme.bodyText1,
        ),
        Image.asset(
          weatherConditionIcon(
            forecastWeatherdata.weatherConditionCode,
          ),
        ),
        Text(
          "$temp\u00B0",
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ],
    );
  }
}
