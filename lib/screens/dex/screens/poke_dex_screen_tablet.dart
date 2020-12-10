import 'package:flutter/material.dart';
import 'package:pokedex/components/app_bar/tablet_app_bar.dart';
import 'package:pokedex/components/container_with_background.dart';
import 'package:pokedex/components/current_party/current_party.dart';
import 'package:pokedex/constants/constants.dart';
import 'package:pokedex/screens/dex/components/pokemon_list_container.dart';

class PokeDexScreenTablet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TabletAppBar(),
      body: ContainerWithBackground(
        child: Padding(
          padding: EdgeInsets.only(
            left: kMarginXL,
            right: kMarginXL,
          ),
          child: Row(
            children: [
              Column(
                children: [
                  Expanded(
                    child: Center(
                      child: Text(
                        CHOOSE_TEAM,
                        style: CHOOSE_YOUR_TEAM_TEXT_STYLE,
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(child: PokemonListContainer()),
              CurrentParty(),
            ],
          ),
        ),
      ),
    );
  }
}
