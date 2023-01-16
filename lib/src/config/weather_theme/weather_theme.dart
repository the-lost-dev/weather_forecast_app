import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/constants_exports.dart';

class WeatherTheme {
  static TextTheme weatherTextTheme = TextTheme(
    headline1: GoogleFonts.spaceGrotesk(
      fontSize: AppSizes.fortyEight,
      fontWeight: FontWeight.w600,
      color: AppColors.whiteColor,
    ),
    headline2: GoogleFonts.spaceGrotesk(
      fontSize: AppSizes.thirtyTwo,
      fontWeight: FontWeight.w400,
      color: AppColors.whiteColor,
    ),
    headline3: GoogleFonts.spaceGrotesk(
      fontSize: AppSizes.twentyFour,
      fontWeight: FontWeight.w600,
      color: AppColors.whiteColor,
    ),
    bodyText1: GoogleFonts.spaceGrotesk(
      fontSize: AppSizes.twenty,
      color: AppColors.whiteColor,
    ),
    bodyText2: GoogleFonts.spaceGrotesk(
      fontSize: AppSizes.eighteen,
      fontWeight: FontWeight.w600,
      color: AppColors.blackColor,
    ),
  );

  static ThemeData weatherTheme() {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: Colors.transparent,
      ),
    );
    return ThemeData(
      scaffoldBackgroundColor: AppColors.whiteColor,
      textTheme: weatherTextTheme,
    );
  }
}
