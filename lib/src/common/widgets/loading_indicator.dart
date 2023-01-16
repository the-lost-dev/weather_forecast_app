import 'package:flutter/material.dart';
import 'package:weather_forecast_app/src/constants/constants_exports.dart';
import 'package:weather_forecast_app/src/utils/helpers.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          const CircularProgressIndicator.adaptive(
            valueColor: AlwaysStoppedAnimation<Color>(
              AppColors.rainyWeatherColor,
            ),
          ),
          sizedBox4,
          Text(
            AppStrings.loadingText.toUpperCase(),
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  color: AppColors.blackColor,
                  
                ),
          )
        ],
      ),
    );
  }
}
