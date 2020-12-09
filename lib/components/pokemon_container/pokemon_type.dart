import 'package:flutter/material.dart';
import 'package:pokedex/constants/constants.dart';
import 'package:pokedex/models/pokemon_details.dart';
import 'package:pokedex/utils/extensions/string_extension.dart';
import 'package:pokedex/utils/utils.dart';

class PokemonType extends StatelessWidget {
  final List<Types> types;

  const PokemonType({Key key, @required this.types}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    List<Widget> getTypes() {
      List<Widget> pokemonWidgets = [];
      if (types != null) {
        for (Types types in types) {
          pokemonWidgets.add(Container(
            decoration: POKEMON_TYPE_CONTAINER.copyWith(
              color: pokemonTypeColor(types?.type?.name),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: kMarginXS,
                vertical: kMarginXXXS,
              ),
              child: Text(
                types.type.name.capitalize(),
                textAlign: TextAlign.center,
                style: POKEMON_TYPE_TEXT_STYLE,
              ),
            ),
          ));
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
