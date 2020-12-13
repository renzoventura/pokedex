import 'package:flutter/material.dart';
import 'package:pokedex/components/orientation_layout.dart';
import 'package:pokedex/screens/party/screens/party_screen_mobile.dart';
import 'package:responsive_builder/responsive_builder.dart';

class PartyScreen extends StatelessWidget {
  static const id = "/partyScreen";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ScreenTypeLayout(
        mobile: OrientationLayout(
          portrait: PartyScreenMobile(),
          // landscape: PartyScreenMobile(),
        ),
        // tablet: PartyScreenTablet(),
      ),
    );
  }
}
