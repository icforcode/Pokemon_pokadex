// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokadex/const/constants.dart';
import 'package:pokadex/const/ui_helper.dart';

import 'package:pokadex/model/pokemon_model.dart';

class PokeInfo extends StatelessWidget {
  final PokemonModel pokemon;
  const PokeInfo({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.w)),
          color: Colors.white),
      child: Padding(
        padding: UiHelper.IconPadding(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildInfoRow("Name", pokemon.name),
            _buildInfoRow("Height", pokemon.height),
            _buildInfoRow("Weight", pokemon.weight),
            _buildInfoRow("Spawn Time", pokemon.spawnTime),
            _buildInfoRow("Weakness", pokemon.weaknesses),
            _buildInfoRow("Pre Evolution", pokemon.prevEvolution),
            _buildInfoRow("Next Evolution", pokemon.nextEvolution),
          ],
        ),
      ),
    );
  }

  _buildInfoRow(String label, dynamic value) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: Constants.PokeInfoLabelTextStyle(),
          ),
          if (value is List && value.isNotEmpty)
            Text(
              value.join(" , "),
              style: Constants.PokeInfoTextStyle(),
            )
          else if (value == null)
            Text(
              "Not Available",
              style: Constants.PokeInfoTextStyle(),
            )
          else
            Text(
              value.toString(),
              style: Constants.PokeInfoTextStyle(),
            ),
        ],
      ),
    );
  }
}
