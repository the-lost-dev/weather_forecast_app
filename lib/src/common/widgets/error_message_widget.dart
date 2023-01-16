import 'package:flutter/material.dart';
import 'package:weather_forecast_app/src/constants/constants_exports.dart';

class ErrorMessageWidget extends StatelessWidget {
  const ErrorMessageWidget({
    Key? key,
    required this.errorMsg,
  }) : super(key: key);

  final String errorMsg;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "$errorMsg!\n${AppStrings.tryAgain}",
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.headline3!.copyWith(
              color: AppColors.redColor,
              fontSize: AppSizes.thirtyTwo,
            ),
      ),
    );
  }
}
