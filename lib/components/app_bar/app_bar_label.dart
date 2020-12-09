import 'package:flutter/material.dart';
import 'package:pokedex/constants/constants.dart';

class AppBarLabel extends StatelessWidget {
  final String label;
  final Function onTap;
  final String targetScreen;

  const AppBarLabel(
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
      onTap: isInCurrentScreen ? null : onTap,
      child: Opacity(
        opacity: isInCurrentScreen ? FULL_OPACITY : SIXTY_PERCENT_OPACITY,
        child: Center(
          child: Text(
            label ?? '',
            style: APP_BAR_LABEL_TEXT_STYLE,
          ),
        ),
      ),
    );
  }
}
