import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/components/container_with_background.dart';
import 'package:pokedex/constants/constants.dart';
import 'package:pokedex/screens/dex/components/current_party_list.dart';
import 'file:///C:/Users/Renzo/Documents/RENZO/CV2020/pokedex/lib/components/app_bar/mobile_app_bar.dart';
import 'file:///C:/Users/Renzo/Documents/RENZO/CV2020/pokedex/lib/components/drawer/mobile_drawer.dart';
import 'package:pokedex/screens/dex/components/pokemon_list_container.dart';

class PokeDexScreenMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: MobileAppBar(),
        endDrawer: MobileDrawer(),
        body: ContainerWithBackground(
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    CHOOSE_TEAM,
                    style: chooseYourTeamTextStyle,
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
              CurrentPartyList(),
              Expanded(child: PokemonListContainer()),
            ],
          ),
        ),
      ),
    );
  }
}
