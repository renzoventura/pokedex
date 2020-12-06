import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/screens/dex/view_model/dex_view_model.dart';
import 'package:provider/provider.dart';

class ConsumerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<DexViewModel>(builder: (context, dexViewModel, child) {
      return Column(
        children: [
          InkWell(
            onTap: () => dexViewModel.getPokemon(),
            child: Container(
              height: 200,
              width: 200,
              color: Colors.blue.shade200,
              child: Center(
                child: Text(
                  "TAP ME",
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          if(dexViewModel.pokemonDetail != null)
            Text(dexViewModel.pokemonDetail.name ?? "null :("),
        ],
      );
    });
  }
}
