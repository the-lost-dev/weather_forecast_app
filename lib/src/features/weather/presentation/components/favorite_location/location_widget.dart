import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_forecast_app/src/constants/constants_exports.dart';
import 'package:weather_forecast_app/src/utils/utils_exports.dart';

import '../search/city_search_box.dart';
import 'favorite_location_popup.dart';

class LocationWidget extends ConsumerWidget {
  const LocationWidget({
    Key? key,
    required this.weatherConditionCode,
  }) : super(key: key);

  final int weatherConditionCode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final city = ref.watch(cityProvider);
    return InkWell(
      onTap: () => showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        constraints: BoxConstraints.loose(
          Size(
            MediaQuery.of(context).size.width,
            MediaQuery.of(context).size.height * .75,
          ),
        ),
        backgroundColor: Colors.transparent,
        builder: (context) => FavoriteLocationPopup(
          weatherConditionCode: weatherConditionCode,
        ),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSizes.twelve,
          vertical: AppSizes.six,
        ),
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(AppSizes.twenty),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.location_on,
              color: weatherConditionColor(weatherConditionCode),
            ),
            SizedBox(width: SizeConfig.blockSizeHorizontal * 2),
            Text(
              city,
              style: Theme.of(context).textTheme.bodyText2,
            ),
          ],
        ),
      ),
    );
  }
}
