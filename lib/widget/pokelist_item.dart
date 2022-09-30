import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokadex/const/constants.dart';
import 'package:pokadex/const/ui_helper.dart';
import 'package:pokadex/model/pokemon_model.dart';
import 'package:pokadex/pages/detail_page.dart';
import 'package:pokadex/widget/poke_image.dart';

class PokeListItem extends StatelessWidget {
  final PokemonModel pokemon;
  const PokeListItem({Key? key, required this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => DetailPage(pokemon: pokemon),
        ));
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.w),
        ),
        elevation: 3,
        shadowColor: Colors.white,
        color: UiHelper.getColorFromType(pokemon.type![0]),
        child: Padding(
          padding: UiHelper.DefaultPadding(),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  pokemon.name ?? "N/A",
                  style: Constants.pokemonTitleStyle(),
                ),
                Chip(
                    label: Text(
                  pokemon.type![0],
                  style: Constants.typeChipTitleStyle(),
                )),
                Expanded(
                  child: PokeImageAndBall(pokemon: pokemon),
                ),
              ]),
        ),
      ),
    );
  }
}
