import 'package:flutter/material.dart';
import 'package:pokedex/screens/party/screens/party_screen_mobile.dart';

class PartyScreen extends StatelessWidget {
  static const id = "/partyScreen";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: PartyScreenMobile(),
    );
  }
}
