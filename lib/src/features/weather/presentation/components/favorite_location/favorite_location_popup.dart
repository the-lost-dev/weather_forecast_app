import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:weather_forecast_app/src/common/common_exports.dart';
import 'package:weather_forecast_app/src/constants/constants_exports.dart';
import 'package:weather_forecast_app/src/utils/utils_exports.dart';

class FavoriteLocationPopup extends ConsumerWidget {
  const FavoriteLocationPopup({
    Key? key,
    required this.weatherConditionCode,
  }) : super(key: key);

  final int weatherConditionCode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(appDatabaseMagerProvider).getFavoriteCities() ?? [];
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
          Text(
            AppStrings.favoriteWeatherLocations,
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .bodyText1!
                .copyWith(color: AppColors.blackColor),
          ),
          sizedBox4,
          data.isEmpty
              ? Text(
                  AppStrings.noSavedLocation,
                  style: Theme.of(context).textTheme.headline3!.copyWith(
                        color: AppColors.blackColor,
                      ),
                )
              : ListView.separated(
                  primary: false,
                  shrinkWrap: true,
                  itemCount: data.length,
                  cacheExtent: AppSizes.ten,
                  addAutomaticKeepAlives: false,
                  addRepaintBoundaries: false,
                  physics: const BouncingScrollPhysics(),
                  separatorBuilder: (_, __) => sizedBox2,
                  itemBuilder: (context, index) => Text(
                    "${index + 1}.  ${data[index]}",
                    style: Theme.of(context).textTheme.headline3!.copyWith(
                          color: AppColors.blackColor,
                        ),
                  ),
                ),
          sizedBox4,
        ],
      ),
    );
  }
}
