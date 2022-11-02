import 'package:flutter/material.dart';
import 'package:project_flutter/constant/colors.dart';

class AppTextStyles {

static final TextStyle px12blue = TextStyle(
    fontFamily: "Monteserrat",
    fontWeight: FontWeight.bold,
    color: AppColors.secondary,
    fontSize: 12,
  );

  static final TextStyle superSmall = TextStyle(
    fontFamily: "Monteserrat",
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    color: AppColors.LightGreyColor,
    fontSize: 11,
  );

  static final TextStyle px10blue = TextStyle(
    fontFamily: "Monteserrat",
    fontWeight: FontWeight.w400,
    color: AppColors.Azure,
    fontSize: 10,
  );
}