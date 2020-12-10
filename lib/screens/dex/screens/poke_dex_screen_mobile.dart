import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/components/app_bar/mobile_app_bar.dart';
import 'package:pokedex/components/container_with_background.dart';
import 'package:pokedex/components/current_party/current_party.dart';
import 'package:pokedex/components/drawer/mobile_drawer.dart';
import 'package:pokedex/components/floating_button_navigator.dart';
import 'package:pokedex/constants/constants.dart';
import 'package:pokedex/screens/dex/components/pokemon_list_container.dart';
import 'package:pokedex/screens/dex/screens/poke_dex_screen.dart';
import 'package:pokedex/screens/party/screens/party_screen.dart';

class PokeDexScreenMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingButtonNavigator(
          title: PARTY_BUTTON_LABEL,
          onTap: () => Navigator.of(context).pushNamedAndRemoveUntil(
              PartyScreen.id, ModalRoute.withName(PokeDexScreen.id)),
        ),
        appBar: MobileAppBar(),
        endDrawer: MobileDrawer(),
        body: ContainerWithBackground(
          child: Padding(
            padding: EdgeInsets.only(
              top: kMarginXL,
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: kMarginXL),
                  child: Row(
                    children: [
                      Text(
                        CHOOSE_TEAM,
                        style: CHOOSE_YOUR_TEAM_TEXT_STYLE,
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: kMarginXL),
                  child: CurrentParty(),
                ),
                Expanded(child: PokemonListContainer()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
