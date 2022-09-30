// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokadex/const/constants.dart';
import 'package:pokadex/model/pokemon_model.dart';

class PokeNameTypeWidget extends StatelessWidget {
  final PokemonModel pokemon;
  const PokeNameTypeWidget({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 0.05.sh),
      child: Container(
        height: ScreenUtil().orientation == Orientation.portrait
            ? 0.15.sh
            : 0.15.sw,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    pokemon.name ?? "",
                    style: Constants.consTitleStyle(),
                  ),
                ),
                Text(
                  ("#${pokemon.num}"),
                  style: Constants.consTitleStyle(),
                ),
              ],
            ),
            SizedBox(
              height: 0.02.sh,
            ),
            Chip(
              label: Text(
                pokemon.type?.join(" , ") ?? "",
                style: Constants.typeChipTitleStyle(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
