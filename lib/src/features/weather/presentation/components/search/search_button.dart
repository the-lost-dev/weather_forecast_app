import 'package:flutter/material.dart';
import 'package:weather_forecast_app/src/common/common_exports.dart';

import 'search_popup.dart';

class SearchButton extends StatelessWidget {
  const SearchButton({
    Key? key,
    required this.weatherConditionCode,
  }) : super(key: key);

  final int weatherConditionCode;

  @override
  Widget build(BuildContext context) {
    return RoundedButton(
      icon: const Icon(Icons.search_sharp),
      onPressed: () => showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        constraints: BoxConstraints.loose(
          Size(
            MediaQuery.of(context).size.width,
            MediaQuery.of(context).size.height * .75,
          ),
        ),
        backgroundColor: Colors.transparent,
        builder: (context) => SearchPopUp(
          weatherConditionCode: weatherConditionCode,
        ),
      ),
    );
  }
}
