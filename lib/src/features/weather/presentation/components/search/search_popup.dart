import 'package:flutter/material.dart';
import 'package:weather_forecast_app/src/common/common_exports.dart';
import 'package:weather_forecast_app/src/constants/constants_exports.dart';
import 'package:weather_forecast_app/src/utils/utils_exports.dart';

import 'city_search_box.dart';


class SearchPopUp extends StatelessWidget {
  const SearchPopUp({
    required this.weatherConditionCode,
    Key? key,
  }) : super(key: key);

  final int weatherConditionCode;

  @override
  Widget build(BuildContext context) {
    return PopupWidget(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              height: AppSizes.six,
              width: AppSizes.fifty,
              decoration: BoxDecoration(
                color: weatherConditionColor(weatherConditionCode),
                borderRadius: BorderRadius.circular(AppSizes.forty),
              ),
            ),
          ),
          sizedBox4,
          CitySearchBox(weatherConditionCode: weatherConditionCode),
          sizedBox4,
        ],
      ),
    );
  }
}
