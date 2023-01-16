import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_forecast_app/src/common/common_exports.dart';
import 'package:weather_forecast_app/src/utils/utils_exports.dart';

import '../../../common/services/location_sevice.dart';
import 'components/components_exports.dart';

class WeatherPage extends ConsumerWidget {
  const WeatherPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    SizeConfig().init(context);
    final currentCityAsyncValue = ref.watch(currentLocationServiceProvider);

    return Scaffold(
      body: AsyncValueWidget(
        value: currentCityAsyncValue,
        data: (_) => const WeatherBody(),
      ),
    );
  }
}
