// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokadex/const/ui_helper.dart';

import 'package:pokadex/model/pokemon_model.dart';
import 'package:pokadex/widget/pokeinfo.dart';

import '../widget/poke_type_name.dart';

class DetailPage extends StatelessWidget {
  final PokemonModel pokemon;
  const DetailPage({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String pokeballImageUrl = "images/pokeball.png";

    return ScreenUtil().orientation == Orientation.portrait
        ? _builtPortraitBody(context, pokeballImageUrl)
        : _builtLandscapeBody(context, pokeballImageUrl);
  }

  Scaffold _builtLandscapeBody(BuildContext context, String pokeballImageUrl) {
    return Scaffold(
      backgroundColor: UiHelper.getColorFromType(pokemon.type![0]),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: UiHelper.IconPadding(),
              child: IconButton(
                  iconSize: 64.h,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.arrow_back_ios)),
            ),
            Expanded(
                child: Row(
              children: [
                Expanded(
                  flex: 4,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      PokeNameTypeWidget(pokemon: pokemon),
                      Expanded(
                        child: Hero(
                          tag: pokemon.id!,
                          child: CachedNetworkImage(
                            imageUrl: pokemon.img ?? "",
                            height: 0.3.sw,
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(flex: 4, child: PokeInfo(pokemon: pokemon)),
              ],
            ))
          ],
        ),
      ),
    );
  }

  Scaffold _builtPortraitBody(BuildContext context, String pokeballImageUrl) {
    return Scaffold(
      backgroundColor: UiHelper.getColorFromType(pokemon.type![0]),
      body: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: UiHelper.IconPadding(),
                child: IconButton(
                    iconSize: 64.w,
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(Icons.arrow_back_ios)),
              ),
            ),
            PokeNameTypeWidget(pokemon: pokemon),
            SizedBox(
              height: 60.h,
            ),
            Expanded(
              child: Stack(
                children: [
                  Positioned(
                    child: Image.asset(
                      pokeballImageUrl,
                      height: 0.2.sh,
                      fit: BoxFit.fitHeight,
                    ),
                    right: 0,
                    top: 50,
                  ),
                  Positioned(
                      bottom: 0,
                      right: 0,
                      left: 0,
                      top: 0.15.sh,
                      child: PokeInfo(pokemon: pokemon)),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Hero(
                      tag: pokemon.id!,
                      child: CachedNetworkImage(
                        imageUrl: pokemon.img ?? "",
                        height: 0.25.sh,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
