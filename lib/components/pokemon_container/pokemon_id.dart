import 'package:flutter/material.dart';
import 'package:pokedex/constants/constants.dart';
import 'package:pokedex/utils/extensions/int_extension.dart';

class PokemonId extends StatelessWidget {
  final int pokemonId;

  const PokemonId({Key key, @required this.pokemonId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: POKEMON_ID_HEIGHT,
      width: POKEMON_ID_WIDTH,
      decoration: POKEMON_ID_CONTAINER,
      child: Center(
        child: Opacity(
          opacity: SIXTY_PERCENT_OPACITY,
          child: Text(
            pokemonId.toPokemonNumber(),
            style: POKEMON_ID_TEXT_STYLE,
          ),
        ),
      ),
    );
  }
}
