import 'package:flutter/material.dart';
import 'package:pokedex/components/drawer/drawer_button.dart';
import 'package:pokedex/components/fade_in_image_container.dart';
import 'package:pokedex/constants/constants.dart';
import 'package:pokedex/utils/image_utils.dart';

class MobileAppBar extends StatelessWidget implements PreferredSizeWidget {
  final AppBar appBar = AppBar();
  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
        InkWell(
          onTap: () => Scaffold.of(context).openEndDrawer(),
          child: Padding(
            padding:
                EdgeInsets.symmetric(horizontal: APP_BAR_ENDING_MOBILE_PADDING),
            child: Center(
                child: DrawerButton()),
          ),
        ),
      ],
      leading: Padding(
        padding: EdgeInsets.only(left: APP_BAR_LEADING_MOBILE_PADDING),
        child: FadeInImageContainer(
          image: AssetImage(ImageUtils.JM_LOGO),
        ),
      ),
      backgroundColor: PRIMARY_COLOR,
      leadingWidth: double.infinity,
    );
  }

  @override
  Size get preferredSize => new Size.fromHeight(appBar.preferredSize.height);
}
