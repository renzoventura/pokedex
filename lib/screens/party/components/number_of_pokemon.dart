import 'package:flutter/material.dart';
import 'package:pokedex/config/config.dart';
import 'package:pokedex/constants/constants.dart';
import 'package:pokedex/di/setup_dependencies.dart';
import 'package:pokedex/screens/party/view_model/party_view_model.dart';
import 'package:provider/provider.dart';

class NumberOfPokemon extends StatefulWidget {
  @override
  _NumberOfPokemonState createState() => _NumberOfPokemonState();
}

class _NumberOfPokemonState extends State<NumberOfPokemon> {
  @override
  void initState() {
    Future.microtask(
      () =>
          Provider.of<PartyViewModel>(context, listen: false).updatePartySize(),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PartyViewModel>(
      builder: (context, partyViewModel, child) {
        String currentPartySize =
            partyViewModel?.currentPartySize?.toString() ?? DEFAULT_PARTY_SIZE;
        return Text(
          "$currentPartySize/${getIt<Config>().maxPartySize.toString()}",
          style: NUMBER_OF_PARTY,
        );
      },
    );
  }
}
