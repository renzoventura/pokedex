import 'package:flutter/material.dart';
import 'file:///C:/Users/Renzo/Documents/RENZO/CV2020/pokedex/lib/components/app_bar/tablet_app_bar.dart';

class PartyScreenTablet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: TabletAppBar(),
        body: Center(
          child: Text(
            "PartyScreenTablet",
          ),
        ),
      ),
    );
  }
}
