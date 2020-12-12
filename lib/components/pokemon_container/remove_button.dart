import 'package:flutter/material.dart';
import 'package:pokedex/constants/constants.dart';

class RemoveButton extends StatelessWidget {
  final Function onTap;

  const RemoveButton({Key key, @required this.onTap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: () => onTap?.call(),
        splashColor: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.only(
            top: kMarginL,
            left: kMarginL,
            right: kMarginL,
          ),
          child: CircleAvatar(
            backgroundColor: Colors.white,
            radius: REMOVE_BUTTON_SIZE,
            child: Icon(
              Icons.close,
              size: REMOVE_BUTTON_ICON,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
