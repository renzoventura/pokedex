import 'package:flutter/material.dart';
import 'package:pokedex/components/current_party/mobile_current_party.dart';
import 'package:pokedex/components/current_party/tablet_current_party.dart';
import 'package:pokedex/components/orientation_layout.dart';
import 'package:responsive_builder/responsive_builder.dart';

class CurrentParty extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: OrientationLayout(
        portrait: MobileCurrentParty(),
        landscape: TabletCurrentParty(),
      ),
      tablet: TabletCurrentParty(),
    );
  }
}
