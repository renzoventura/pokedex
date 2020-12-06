import 'package:flutter/material.dart';
import 'package:pokedex/screens/dex/screens/poke_dex_screen.dart';
import 'package:pokedex/screens/party/screens/party_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PokeDex',
      initialRoute: PokeDexScreen.id,
      routes: {
        PokeDexScreen.id: (context) => PokeDexScreen(),
        PartyScreen.id: (context) => PartyScreen(),
      },
    );
  }
}
