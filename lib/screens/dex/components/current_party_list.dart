import 'package:flutter/material.dart';
import 'package:pokedex/constants/constants.dart';
import 'package:pokedex/utils/image_utils.dart';

class CurrentPartyList extends StatefulWidget {
  @override
  _CurrentPartyListState createState() => _CurrentPartyListState();
}

class _CurrentPartyListState extends State<CurrentPartyList> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kMarginXL),
      child: Row(
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
