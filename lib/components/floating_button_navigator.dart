import 'package:flutter/material.dart';
import 'package:pokedex/constants/constants.dart';

class FloatingButtonNavigator extends StatelessWidget {
  final String title;
  final Function onTap;

  const FloatingButtonNavigator({Key key, this.title : "", this.onTap})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: floatingButtonDecoration,
      child: FloatingActionButton(
        backgroundColor: FLOATING_BUTTON_NAVIGATOR_COLOR,
        onPressed: onTap,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: FLOATING_BUTTON_TITLE,
                textAlign: TextAlign.center,
              ),
              Icon(
                Icons.arrow_forward,
              )
            ],
          ),
        ),
      ),
    );
  }
}
