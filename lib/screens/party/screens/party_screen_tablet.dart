import 'package:flutter/material.dart';
import 'package:pokedex/components/app_bar/tablet_app_bar.dart';
import 'package:pokedex/components/container_with_background.dart';

class PartyScreenTablet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: TabletAppBar(),
        body: ContainerWithBackground(
          child: Center(
            child: Text(
              "PartyScreenTablet",
            ),
          ),
        ),
      ),
    );
  }
}
