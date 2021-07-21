import 'dart:ui';

import 'package:flutter/material.dart';

import 'app_colors.dart';

TextStyle headline1 = const TextStyle(
    color: Colors.black, fontSize: 64, fontWeight: FontWeight.w900);
TextStyle headline2 =
    TextStyle(color: darkBlue, fontSize: 32, fontWeight: FontWeight.w900);
TextStyle body1 = const TextStyle(color: Colors.black, fontSize: 18);
TextStyle subtitle1 =
    TextStyle(color: grey, fontSize: 14, fontWeight: FontWeight.w600);
TextTheme textTheme = TextTheme(
    headline1: headline1,
    headline2: headline2,
    bodyText1: body1,
    subtitle1: subtitle1);
