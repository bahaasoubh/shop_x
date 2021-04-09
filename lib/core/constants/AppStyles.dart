import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopx/core/constants/AppColors.dart';

class AppStyles {
  AppStyles._();


//Example
//   static get placeDetailsViewsTextStyle =>
//         TextStyle(fontSize: 12 * Dimens.zoom);


  static get kAppbarSizeText => TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: AppColors.White,
      );

  static get kCardTextStyle => TextStyle(
        fontSize: 15,
        color: AppColors.Black,
      );

  static get kTextFlagStyle => TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.bold,
        letterSpacing: 2.5,
      );
}
