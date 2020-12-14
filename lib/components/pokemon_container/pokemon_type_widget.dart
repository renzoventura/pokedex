import 'package:flutter/material.dart';
import 'package:pokedex/constants/constants.dart';
import 'package:pokedex/utils/utils.dart';
import 'package:pokedex/utils/extensions/string_extension.dart';

class PokemonTypeWidget extends StatelessWidget {
  final String typeName;

  const PokemonTypeWidget({Key key, @required this.typeName}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: POKEMON_TYPE_CONTAINER.copyWith(
        color: pokemonTypeColor(typeName),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: kMarginXS,
          vertical: kMarginXXXS,
        ),
        child: Text(
          typeName?.capitalize() ?? "",
          textAlign: TextAlign.center,
          style: POKEMON_TYPE_TEXT_STYLE,
        ),
      ),
    );
  }
}
