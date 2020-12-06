import 'package:flutter/material.dart';
import 'package:pokedex/components/container_with_background.dart';
import 'package:pokedex/components/drawer/drawer_labels.dart';
import 'package:pokedex/components/fade_in_image_container.dart';
import 'package:pokedex/components/user_profile_picture.dart';
import 'package:pokedex/constants/constants.dart';
import 'package:pokedex/screens/dex/screens/poke_dex_screen.dart';
import 'package:pokedex/screens/party/screens/party_screen.dart';
import 'package:pokedex/utils/image_utils.dart';

class MobileDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Drawer(
        child: ContainerWithBackground(
          color: PRIMARY_COLOR,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(
                        Icons.close,
                        color: Colors.white,
                      )),
                ],
              ),
              UserProfilePicture(
                radius: drawerProfilePicRadius,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DrawerLabels(
                      label: POKEDEX,
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.pushNamed(context, PokeDexScreen.id);
                      },
                      targetScreen: PokeDexScreen.id,
                    ),
                    SizedBox(
                      height: kMarginXXXXL,
                    ),
                    DrawerLabels(
                      label: PARTY,
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.pushNamed(context, PartyScreen.id);
                      },
                      targetScreen: PartyScreen.id,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: kMarginXXXXXL),
                child: FadeInImageContainer(
                  image: AssetImage(ImageUtils.JM_LOGO),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
