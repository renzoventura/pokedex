import 'package:flutter/material.dart';
import 'file:///C:/Users/Renzo/Documents/RENZO/CV2020/pokedex/lib/components/drawer/mobile_drawer.dart';
import 'file:///C:/Users/Renzo/Documents/RENZO/CV2020/pokedex/lib/components/app_bar/mobile_app_bar.dart';

class PartyScreenMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: MobileAppBar(),
        endDrawer: MobileDrawer(),
        body: Center(
          child: Text(
            "PartyScreenMobile",
          ),
        ),
      ),
    );
  }
}
