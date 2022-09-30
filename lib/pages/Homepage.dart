import 'package:flutter/material.dart';
import 'package:pokadex/model/pokemon_model.dart';
import 'package:pokadex/services/pokadex_api.dart';
import 'package:pokadex/widget/app_title.dart';
import 'package:pokadex/widget/pokemon_list_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OrientationBuilder(
        builder: (context, orientation) => Column(
          children: [
            AppTittle(),
            Expanded(child:  PokemonList()),
          ],
        ),
      ),
    );
  }
}
