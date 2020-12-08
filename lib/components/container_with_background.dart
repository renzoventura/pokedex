import 'package:flutter/cupertino.dart';
import 'package:pokedex/constants/constants.dart';
import 'package:pokedex/utils/image_utils.dart';

class ContainerWithBackground extends StatelessWidget {
  final Widget child;
  final Color color;
  const ContainerWithBackground({Key key, @required this.child, this.color})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: kMarginXL,
        left: kMarginXL,
        right: kMarginXL,
      ),
      decoration: BoxDecoration(
        color: color,
        image: DecorationImage(
          alignment: Alignment.centerLeft,
          fit: BoxFit.contain,
          image: AssetImage(ImageUtils.PIKACHU_BACKGROUND),
          // fit: BoxFit.cover,
        ),
      ),
      child: child,
    );
  }
}
