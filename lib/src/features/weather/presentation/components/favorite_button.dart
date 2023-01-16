import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_forecast_app/src/common/common_exports.dart';
import 'package:weather_forecast_app/src/constants/constants_exports.dart';

import '../controllers/favorite_button_controller.dart';

class FavoriteButton extends ConsumerWidget {
  const FavoriteButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isFavorite = ref.watch(favoriteButtonControllerProvider);
    // final String city = ref.watch(cityProvider);
    // final bool cityExists =
    //     ref.watch(appDatabaseMagerProvider).getFavoriteCities()!.contains(city);
    // isFavorite = cityExists;

    return RoundedButton(
      icon: Icon(
        isFavorite ? Icons.favorite_sharp : Icons.favorite_border_outlined,
        color: isFavorite ? AppColors.redColor : AppColors.blackColor,
      ),
      onPressed: () {
        ref.read(favoriteButtonControllerProvider.notifier).saveFavorite(
              isFavorite: !isFavorite,
            );
      },
    );
  }
}
