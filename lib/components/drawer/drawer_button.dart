import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pokedex/constants/constants.dart';
import 'package:pokedex/utils/svg_utils.dart';

class DrawerButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(SvgUtils.DRAWER_LINE),
        SizedBox(
          height: kMarginXXS,
        ),
        SvgPicture.asset(SvgUtils.DRAWER_LINE),
      ],
    );
  }
}
