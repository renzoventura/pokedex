import 'package:flutter/material.dart';
import 'package:pokedex/components/app_bar/tablet_app_bar.dart';
import 'package:pokedex/components/container_with_background.dart';
import 'package:pokedex/components/floating_button_navigator.dart';
import 'package:pokedex/constants/constants.dart';
import 'package:pokedex/screens/party/components/number_of_pokemon.dart';
import 'package:pokedex/screens/party/current_party.dart';

class PartyScreenTablet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: TabletAppBar(),
      body: ContainerWithBackground(
        child: Center(
          child: Row(
            children: [
              Center(
                child: Text(
                  ASH_PARTY,
                  style: CHOOSE_YOUR_TEAM_TEXT_STYLE,
                  textAlign: TextAlign.center,
                ),
              ),
              Expanded(
                child: CurrentParty(
                  gridNumber: 3,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  NumberOfPokemon(),
                  FloatingButtonNavigator(
                    title: DEX_BUTTON_LABEL,
                    onTap: () => Navigator.pop(context),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
