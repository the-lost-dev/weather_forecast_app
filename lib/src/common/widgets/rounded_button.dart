import 'package:flutter/material.dart';
import 'package:weather_forecast_app/src/constants/constants_exports.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    Key? key,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  final Widget icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSizes.six),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(AppSizes.fifty),
      ),
      child: InkWell(
        onTap: onPressed,
        child: icon,
      ),
    );
  }
}
