import 'package:flutter/material.dart';
import 'package:pokedex/utils/image_utils.dart';

class UserProfilePicture extends StatelessWidget {
  final double radius;

  const UserProfilePicture({
    Key key,
    this.radius,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      foregroundColor: Colors.white,
      backgroundColor: Colors.white,
      radius: radius,
      backgroundImage: AssetImage(ImageUtils.AVATAR),
    );
  }
}
