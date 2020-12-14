import 'package:flutter/material.dart';
import 'package:pokedex/components/app_bar/tablet_app_bar.dart';
import 'package:pokedex/components/container_with_background.dart';
import 'package:pokedex/components/current_party/mobile_current_party.dart';
import 'package:pokedex/constants/constants.dart';
import 'package:pokedex/screens/dex/components/pokedex_list_container.dart';
import 'package:pokedex/screens/dex/components/scroll_for_more.dart';
import 'package:pokedex/screens/dex/components/sorting_dropdown.dart';

class PokeDexScreenTablet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: TabletAppBar(),
      body: ContainerWithBackground(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: kMarginXS,
          ),
          child: Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    CHOOSE_TEAM,
                    style: CHOOSE_YOUR_TEAM_TEXT_STYLE_TABLET,
                    textAlign: TextAlign.left,
                  ),
                  SortingDropdown(),
                  ScrollForMore(),
                ],
              ),
              Expanded(
                child: PokedexListContainer(
                  gridSize: TABLET_GRID_SIZE,
                ),
              ),
              Column(
                children: [
                  Expanded(
                    child: MobileCurrentParty(
                      isTablet: true,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
