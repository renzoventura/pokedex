import 'package:flutter/material.dart';
import 'file:///C:/Users/Renzo/Documents/RENZO/CV2020/pokedex/lib/components/drawer/mobile_drawer.dart';
import 'file:///C:/Users/Renzo/Documents/RENZO/CV2020/pokedex/lib/components/app_bar/mobile_app_bar.dart';
import 'package:pokedex/components/container_with_background.dart';
import 'package:pokedex/components/floating_button_navigator.dart';
import 'package:pokedex/constants/constants.dart';
import 'package:pokedex/screens/dex/screens/poke_dex_screen.dart';
import 'package:pokedex/screens/party/screens/party_screen.dart';

class PartyScreenMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingButtonNavigator(
          title: DEX_BUTTON_LABEL,
          onTap: () => Navigator.of(context).pushNamedAndRemoveUntil(
              PokeDexScreen.id, ModalRoute.withName(PartyScreen.id)),
        ),
        appBar: MobileAppBar(),
        endDrawer: MobileDrawer(),
        body: ContainerWithBackground(
          child: Center(
            child: Text(
              "PartyScreenMobile",
            ),
          ),
        ),
      ),
    );
  }
}
