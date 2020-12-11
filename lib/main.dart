import 'package:flutter/material.dart';
import 'package:pokedex/config/config.dart';
import 'package:pokedex/di/setup_dependencies.dart';
import 'package:pokedex/screens/dex/screens/poke_dex_screen.dart';
import 'package:pokedex/screens/dex/view_model/dex_view_model.dart';
import 'package:pokedex/screens/party/screens/party_screen.dart';
import 'package:pokedex/screens/party/view_model/party_view_model.dart';
import 'package:provider/provider.dart';
class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => DexViewModel()),
        ChangeNotifierProvider(create: (context) => PartyViewModel()),
      ],
      child: MaterialApp(
        title: getIt<Config>().appTitle,
        initialRoute: PokeDexScreen.id,
        routes: {
          PokeDexScreen.id: (context) => PokeDexScreen(),
          PartyScreen.id: (context) => PartyScreen(),
        },
      ),
    );
  }
}
