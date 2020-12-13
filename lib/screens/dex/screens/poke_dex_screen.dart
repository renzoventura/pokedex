import 'package:flutter/material.dart';
import 'package:pokedex/components/orientation_layout.dart';
import 'package:pokedex/screens/dex/screens/poke_dex_screen_mobile.dart';
import 'package:pokedex/screens/dex/screens/poke_dex_screen_tablet.dart';
import 'package:responsive_builder/responsive_builder.dart';

class PokeDexScreen extends StatelessWidget {
  static const id = "/pokeDexScreen";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ScreenTypeLayout(
        mobile: PokeDexScreenMobile(),
        // mobile: OrientationLayout(
        //   portrait: PokeDexScreenMobile(),
        //   // landscape: PokeDexScreenTablet(),
        // ),
        tablet: PokeDexScreenTablet(),
      ),
    );
  }
}

