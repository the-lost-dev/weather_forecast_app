import 'package:flutter/material.dart';
import 'package:weather_forecast_app/src/constants/constants_exports.dart';

String weatherConditionImage(int weatherConditionCode) {
  if (weatherConditionCode.toString().startsWith('2') ||
      weatherConditionCode.toString().startsWith('3') ||
      weatherConditionCode.toString().startsWith('5') ||
      weatherConditionCode.toString().startsWith('6')) {
    return AppImages.rainyWeatherImage;
  } else if (weatherConditionCode == 800) {
    return AppImages.sunnyWeatherImage;
  }
  return AppImages.cloudyWeatherImage;
}

String weatherConditionIcon(int weatherConditionCode) {
  if (weatherConditionCode.toString().startsWith('2') ||
      weatherConditionCode.toString().startsWith('3') ||
      weatherConditionCode.toString().startsWith('5') ||
      weatherConditionCode.toString().startsWith('6')) {
    return AppImages.rainyyWeatherIcon;
  } else if (weatherConditionCode == 800) {
    return AppImages.sunnyWeatherIcon;
  }
  return AppImages.cloudyWeatherIcon;
}

Color weatherConditionColor(int weatherConditionCode) {
  if (weatherConditionCode.toString().startsWith('2') ||
      weatherConditionCode.toString().startsWith('3') ||
      weatherConditionCode.toString().startsWith('5') ||
      weatherConditionCode.toString().startsWith('6')) {
    return AppColors.rainyWeatherColor;
  } else if (weatherConditionCode == 800) {
    return AppColors.sunnyWeatherColor;
  }
  return AppColors.cloudyWeatherColor;
}
