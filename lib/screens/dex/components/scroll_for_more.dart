import 'package:flutter/material.dart';
import 'package:pokedex/constants/constants.dart';

class ScrollForMore extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          SCROLL_FOR_MORE,
          style: SORT_BY_VALUES_TEXT_STYLE,
        ),
        Icon(Icons.arrow_drop_down_sharp),
      ],
    );
  }
}
