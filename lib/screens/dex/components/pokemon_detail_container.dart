import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/constants/constants.dart';
import 'package:pokedex/models/pokemon_details.dart';

class PokemonDetailContainer extends StatelessWidget {
  final PokemonDetails pokemonDetails;

  const PokemonDetailContainer({Key key, this.pokemonDetails})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    List<Widget> getTypes() {
      List<Widget> pokemonWidgets = [];
      if (pokemonDetails.types != null) {
        for (Types types in pokemonDetails.types) {
          pokemonWidgets.add(Text(types.type.name));
        }
      }
      return pokemonWidgets;
    }

    return Container(
      child: Column(
        children: [
          CachedNetworkImage(
            imageUrl: pokemonDetails.sprites.frontDefault,
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
          Text(pokemonDetails.id.toString()),
          Text(pokemonDetails.name),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: getTypes(),
          )
        ],
      ),
    );
  }
}
