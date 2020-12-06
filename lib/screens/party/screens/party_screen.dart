import 'package:flutter/material.dart';
import 'package:pokedex/components/orientation_layout.dart';
import 'package:pokedex/screens/party/screens/party_screen_mobile.dart';
import 'package:pokedex/screens/party/screens/party_screen_tablet.dart';
import 'package:responsive_builder/responsive_builder.dart';

class PartyScreen extends StatelessWidget {
  static const id = "/partyScreen";
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: OrientationLayout(
        portrait: PartyScreenMobile(),
        landscape: PartyScreenTablet(),
      ),
      tablet: PartyScreenTablet(),
    );
  }
}
