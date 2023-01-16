import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_forecast_app/src/common/common_exports.dart';

import '../components/search/city_search_box.dart';

final favoriteProvider = StateProvider<bool>((ref) => false);

class FavoriteButtonController extends StateNotifier<bool> {
  FavoriteButtonController({
    required this.ref,
  }) : super(false);

  final Ref ref;

  bool saveFavorite({required bool isFavorite}) {
    state = false;

    final appDatabaseManager = ref.read(appDatabaseMagerProvider);
    final city = ref.read(cityProvider);

    final List<String> currentFavorite =
        appDatabaseManager.getFavoriteCities() ?? [];

    final subSet = <String>{};

    if (isFavorite) {
      subSet.add(city);
      currentFavorite.addAll(subSet);
      appDatabaseManager.saveFavoriteCity(currentFavorite);
      return state = true;
    } else {
      currentFavorite.remove(city);
      appDatabaseManager.saveFavoriteCity(currentFavorite);
      return state = false;
    }
  }
}

final favoriteButtonControllerProvider =
    StateNotifierProvider.autoDispose<FavoriteButtonController, bool>(
  (ref) => FavoriteButtonController(ref: ref),
);
