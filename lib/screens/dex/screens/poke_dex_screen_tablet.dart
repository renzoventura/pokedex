import 'package:flutter/material.dart';
import 'package:pokedex/components/container_with_background.dart';
import 'file:///C:/Users/Renzo/Documents/RENZO/CV2020/pokedex/lib/components/app_bar/tablet_app_bar.dart';
import 'package:pokedex/components/fade_in_image_container.dart';
import 'package:pokedex/utils/image_utils.dart';

class PokeDexScreenTablet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: TabletAppBar(),
        body: ContainerWithBackground(
          child: Center(
            child: Column(
              children: [
                Text(
                  "PokeDexTablet",
                ),
                FadeInImageContainer(
                  image: AssetImage(
                    ImageUtils.JM_LOGO,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
