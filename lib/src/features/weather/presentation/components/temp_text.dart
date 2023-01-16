import 'package:flutter/material.dart';

class TempText extends StatelessWidget {
  const TempText({
    Key? key,
    required this.temp,
    required this.tempRangeText,
  }) : super(key: key);

  final String temp;
  final String tempRangeText;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          temp,
          style: Theme.of(context).textTheme.headline3,
        ),
        Text(
          tempRangeText,
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ],
    );
  }
}
