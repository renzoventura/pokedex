import 'package:flutter/material.dart';
import 'package:pokedex/constants/constants.dart';

class DrawerLabels extends StatelessWidget {
  final String label;
  final Function onTap;
  final String targetScreen;

  const DrawerLabels(
      {Key key,
      @required this.label,
      @required this.onTap,
      @required this.targetScreen})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isInCurrentScreen =
        ModalRoute.of(context).settings.name == targetScreen;
    return InkWell(
      onTap: isInCurrentScreen ? () => Navigator.pop(context) : onTap,
      child: Opacity(
        opacity: isInCurrentScreen ? fullOpacity : sixtyPercentOpacity,
        child: Center(
          child: Text(
            label ?? '',
            style: drawerLabelTextStyle,
          ),
        ),
      ),
    );
  }
}
