import 'package:flutter/material.dart';
import 'package:pokedex/screens/dex/screens/poke_dex_screen_mobile.dart';

class PokeDexScreen extends StatelessWidget {
  static const id = "/pokeDexScreen";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: PokeDexScreenMobile(),
    );
  }
}

