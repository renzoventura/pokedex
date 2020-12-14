import 'package:flutter/material.dart';
import 'package:pokedex/components/app_bar/mobile_app_bar.dart';
import 'package:pokedex/components/container_with_background.dart';
import 'package:pokedex/components/drawer/mobile_drawer.dart';
import 'package:pokedex/components/floating_button_navigator.dart';
import 'package:pokedex/constants/constants.dart';
import 'package:pokedex/screens/party/components/number_of_pokemon.dart';
import 'package:pokedex/screens/party/current_party.dart';

class PartyScreenMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingButtonNavigator(
        title: DEX_BUTTON_LABEL,
        onTap: () => Navigator.pop(context),
      ),
      appBar: MobileAppBar(),
      endDrawer: MobileDrawer(),
      body: ContainerWithBackground(
        child: Padding(
          padding: EdgeInsets.only(
            top: kMarginXL,
          ),
          child: ListView(
            shrinkWrap: true,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: kMarginXL),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      ASH_PARTY,
                      style: CHOOSE_YOUR_TEAM_TEXT_STYLE,
                      textAlign: TextAlign.left,
                    ),
                    NumberOfPokemon(),
                  ],
                ),
              ),
              CurrentParty(),
            ],
          ),
        ),
      ),
    );
  }
}
