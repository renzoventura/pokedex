import 'package:flutter/material.dart';
import 'package:pokedex/components/app_bar/app_bar_label.dart';
import 'package:pokedex/components/fade_in_image_container.dart';
import 'package:pokedex/components/user_profile_picture.dart';
import 'package:pokedex/constants/constants.dart';
import 'package:pokedex/screens/dex/screens/poke_dex_screen.dart';
import 'package:pokedex/screens/party/screens/party_screen.dart';
import 'package:pokedex/utils/image_utils.dart';

class TabletAppBar extends StatelessWidget implements PreferredSizeWidget {
  final AppBar appBar = AppBar();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      actions: [
        AppBarLabel(
          label: POKEDEX,
          onTap: () => Navigator.pushNamed(context, PokeDexScreen.id),
          targetScreen: PokeDexScreen.id,
        ),
        SizedBox(
          width: appbarLabelPadding,
        ),
        AppBarLabel(
          label: PARTY,
          onTap: () => Navigator.pushNamed(context, PartyScreen.id),
          targetScreen: PartyScreen.id,
        ),
        SizedBox(
          width: appbarLabelPadding,
        ),
        UserProfilePicture(
          radius: APP_BAR_PROFILE_RADIUS,
        ),
        SizedBox(
          width: logoAppBarEndingMobilePadding,
        ),
      ],
      leading: FadeInImageContainer(
        image: AssetImage(ImageUtils.JM_LOGO),
      ),
      backgroundColor: PRIMARY_COLOR,
      leadingWidth: double.infinity,
    );
  }

  @override
  Size get preferredSize => new Size.fromHeight(appBar.preferredSize.height);
}
