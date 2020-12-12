import 'package:flutter/material.dart';
import 'package:pokedex/components/pokemon_container/pokemon_type_widget.dart';
import 'package:pokedex/constants/constants.dart';

class PokemonTypesContainer extends StatelessWidget {
  final List<String> types;

  const PokemonTypesContainer({Key key, @required this.types})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    List<Widget> getTypes() {
      List<Widget> pokemonWidgets = [];
      if (types != null) {
        for (String typeName in types) {
          pokemonWidgets.add(
            PokemonTypeWidget(
              typeName: typeName,
            ),
          );
        }
      }
      return pokemonWidgets;
    }

    return Container(
      padding: const EdgeInsets.only(
        bottom: kMargin,
        left: kMargin,
        right: kMargin,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: getTypes(),
      ),
    );
  }
}
