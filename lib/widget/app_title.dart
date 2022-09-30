import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokadex/const/ui_helper.dart';

import '../const/constants.dart';

class AppTittle extends StatefulWidget {
  const AppTittle({super.key});

  @override
  State<AppTittle> createState() => _AppTittleState();
}

class _AppTittleState extends State<AppTittle> {
  String pokeballImageUrl = "images/pokeball.png";
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: UiHelper.getAppTitleWidgetHeigth(),
      //color: Colors.red,
      child: Stack(
        children: [
          Padding(
            padding: UiHelper.DefaultPadding(),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  Constants.title,
                  style: Constants.consTitleStyle(),
                )),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Image.asset(
              pokeballImageUrl,
              width: ScreenUtil().orientation == Orientation.portrait
                  ? 0.2.sh
                  : 0.2.sw,
              fit: BoxFit.fitWidth,
            ),
          ),
        ],
      ),
    );
  }
}
