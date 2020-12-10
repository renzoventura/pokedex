import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pokedex/components/pokemon_container/pokemon_id.dart';
import 'package:pokedex/components/pokemon_container/pokemon_type.dart';
import 'package:pokedex/constants/constants.dart';
import 'package:pokedex/models/pokemon_details.dart';
import 'package:pokedex/utils/extensions/string_extension.dart';
import 'package:pokedex/utils/svg_utils.dart';

class PokemonDetailContainer extends StatelessWidget {
  final PokemonDetails pokemonDetails;

  const PokemonDetailContainer({Key key, this.pokemonDetails})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: kMarginS,
      ),
      child: ColumnSuper(
        alignment: Alignment.center,
        invert: true,
        innerDistance: OVERLAY_DISTANCE_POKEMON,
        children: [
          CachedNetworkImage(
            imageUrl: pokemonDetails.sprites.frontDefault,
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
          Container(
            decoration: POKEMON_CONTAINER,
            height: POKEMON_CONTAINER_HEIGHT,
            width: POKEMON_CONTAINER_WIDTH,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset(
                  SvgUtils.HALF_POKEBALL,
                  width: HALF_POKEBALL_WIDTH,
                ),
                PokemonId(
                  pokemonId: pokemonDetails.id,
                ),
                Text(
                  pokemonDetails.name.capitalize(),
                  style: POKEMON_NAME_TEXT_STYLE,
                ),
                PokemonType(
                  types: pokemonDetails.types,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
