import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Constants {
  Constants._();

  static const String title = "PokeDex";

  static TextStyle consTitleStyle() {
    return TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: _calculateFontSize(95));
  }

  static TextStyle pokemonTitleStyle() {
    return TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: _calculateFontSize(34));
  }

  static TextStyle typeChipTitleStyle() {
    return TextStyle(color: Colors.white, fontSize: _calculateFontSize(35));
  }
// user font sıze confıgure edilirse senkronize eden fonksıyon

  static _calculateFontSize(int size) {
    if (ScreenUtil().orientation == Orientation.portrait) {
      return size.sp;
    } else {
      return (size * 0.7).sp;
    }
  }

  static PokeInfoLabelTextStyle() {
    return TextStyle(fontSize: _calculateFontSize(30), color: Colors.black);
  }

  static PokeInfoTextStyle() {
    return TextStyle(fontSize: _calculateFontSize(22), color: Colors.black);
  }
}
