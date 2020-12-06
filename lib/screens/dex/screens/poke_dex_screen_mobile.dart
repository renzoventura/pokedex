import 'package:flutter/material.dart';
import 'file:///C:/Users/Renzo/Documents/RENZO/CV2020/pokedex/lib/components/app_bar/mobile_app_bar.dart';
import 'file:///C:/Users/Renzo/Documents/RENZO/CV2020/pokedex/lib/components/drawer/mobile_drawer.dart';
import 'package:pokedex/components/fade_in_image_container.dart';
import 'package:pokedex/utils/image_utils.dart';

class PokeDexScreenMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: MobileAppBar(),
        endDrawer: MobileDrawer(),
        body: Column(
          children: [
            Column(
              children: [
                // AppBarMobile(),
                Text(
                  "PokeDexMobile",
                ),
                FadeInImageContainer(
                  image: AssetImage(ImageUtils.JM_LOGO),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
