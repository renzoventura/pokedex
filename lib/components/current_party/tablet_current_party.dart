import 'package:flutter/material.dart';
import 'package:pokedex/constants/constants.dart';
import 'package:pokedex/utils/image_utils.dart';

class TabletCurrentParty extends StatefulWidget {
  @override
  _TabletCurrentPartyState createState() => _TabletCurrentPartyState();
}

class _TabletCurrentPartyState extends State<TabletCurrentParty> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kMarginXL),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(ImageUtils.PARTY_PLACEHOLDER_SMALL),
          Image.asset(ImageUtils.PARTY_PLACEHOLDER_SMALL),
          Image.asset(ImageUtils.PARTY_PLACEHOLDER_SMALL),
          Image.asset(ImageUtils.PARTY_PLACEHOLDER_SMALL),
          Image.asset(ImageUtils.PARTY_PLACEHOLDER_SMALL),
          Image.asset(ImageUtils.PARTY_PLACEHOLDER_SMALL),
        ],
      ),
    );
  }
}
