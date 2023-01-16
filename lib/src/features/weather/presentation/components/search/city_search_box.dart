import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_forecast_app/src/constants/constants_exports.dart';
import 'package:weather_forecast_app/src/utils/utils_exports.dart';

import '../../../../../common/services/location_sevice.dart';

final cityProvider = StateProvider<String>((ref) {
  final currentCityLocation = ref.watch(currentLocationServiceProvider).value!;
  String city = 'Abuja';
  if (currentCityLocation != city) {
    city = currentCityLocation;
  }
  return city;
});

class CitySearchBox extends ConsumerStatefulWidget {
  const CitySearchBox({
    Key? key,
    required this.weatherConditionCode,
  }) : super(key: key);

  final int weatherConditionCode;

  @override
  ConsumerState<CitySearchBox> createState() => _CitySearchRowState();
}

class _CitySearchRowState extends ConsumerState<CitySearchBox> {
  static const _radius = 30.0;

  late final _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _searchController.text = ref.read(cityProvider);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.twenty),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: SizedBox(
              height: AppSizes.fifty,
              child: TextField(
                controller: _searchController,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.black),
                decoration: const InputDecoration(
                  fillColor: AppColors.whiteColor,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(_radius),
                      bottomLeft: Radius.circular(_radius),
                    ),
                  ),
                ),
                onSubmitted: (value) {
                  ref.read(cityProvider.notifier).state = value;
                  context.pop();
                },
              ),
            ),
          ),
          InkWell(
            child: Container(
              height: AppSizes.fifty,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: weatherConditionColor(widget.weatherConditionCode),
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(_radius),
                  bottomRight: Radius.circular(_radius),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSizes.sixteen,
                ),
                child: Text(
                  AppStrings.search,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
            ),
            onTap: () {
              FocusScope.of(context).unfocus();
              ref.read(cityProvider.notifier).state = _searchController.text;
              context.pop();
            },
          )
        ],
      ),
    );
  }
}
