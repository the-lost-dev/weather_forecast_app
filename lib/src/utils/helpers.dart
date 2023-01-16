import 'package:flutter/material.dart';

import 'size_config.dart';

///Widgets
SizedBox sizedBox2 = SizedBox(height: SizeConfig.blockSizeVertical * 2);
SizedBox sizedBox4 = SizedBox(height: SizeConfig.blockSizeVertical * 4);
SizedBox sizedBox6 = SizedBox(height: SizeConfig.blockSizeVertical * 6);
SizedBox sizedBox8 = SizedBox(height: SizeConfig.blockSizeVertical * 8);
SizedBox sizedBox14 = SizedBox(height: SizeConfig.blockSizeVertical * 14);

///Paddings
EdgeInsets mainPadding = EdgeInsets.symmetric(
  vertical: SizeConfig.blockSizeVertical * 2,
);

EdgeInsets horizontalPadding = EdgeInsets.only(
  left: SizeConfig.blockSizeHorizontal * 4,
);

EdgeInsets symmetricHorizontalPadding = EdgeInsets.symmetric(
  horizontal: SizeConfig.blockSizeHorizontal * 4,
);

EdgeInsets padding4 = const EdgeInsets.all(5);
