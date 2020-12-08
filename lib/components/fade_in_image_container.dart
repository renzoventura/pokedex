import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:pokedex/constants/constants.dart';

class FadeInImageContainer extends StatelessWidget {
  final ImageProvider image;
  final ImageProvider placeholder;
  final double height;
  const FadeInImageContainer(
      {Key key, @required this.image, this.placeholder, this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeInImage(
      fadeInDuration: Duration(
        milliseconds: FADE_IN_DURATION,
      ),
      height: height,
      placeholder: placeholder ?? MemoryImage(kTransparentImage),
      image: image,
    );
  }
}
