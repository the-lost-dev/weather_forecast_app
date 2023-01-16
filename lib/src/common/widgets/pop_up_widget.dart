import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:weather_forecast_app/src/constants/constants_exports.dart';

class PopupWidget extends StatelessWidget {
  const PopupWidget({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Wrap(
        children: [
          BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: AppSizes.four,
              sigmaY: AppSizes.four,
            ),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                vertical: AppSizes.fourteen,
                horizontal: AppSizes.twenty,
              ),
              decoration: const BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(AppSizes.forty),
                  topRight: Radius.circular(AppSizes.forty),
                ),
              ),
              child: child,
            ),
          ),
        ],
      ),
    );
  }
}
