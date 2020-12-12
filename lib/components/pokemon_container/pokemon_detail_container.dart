import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pokedex/components/pokemon_container/pokemon_id.dart';
import 'package:pokedex/components/pokemon_container/pokemon_types_container.dart';
import 'package:pokedex/components/pokemon_container/remove_button.dart';
import 'package:pokedex/constants/constants.dart';
import 'package:pokedex/utils/extensions/string_extension.dart';
import 'package:pokedex/utils/svg_utils.dart';

class PokemonDetailContainer extends StatelessWidget {
  final String pokemonName;
  final int pokemonId;
  final List<String> pokemonTypes;
  final Function onAdd;
  final String pokemonImage;
  final Function onRemove;

  const PokemonDetailContainer({
    Key key,
    @required this.pokemonName,
    @required this.pokemonId,
    @required this.pokemonTypes,
    @required this.pokemonImage,
    this.onAdd,
    this.onRemove,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(
            horizontal: kMarginS, vertical: kMarginXXXL),
        child: Stack(
          overflow: Overflow.visible,
          children: [
            InkWell(
              onTap: () => onAdd?.call(),
              child: Stack(
                overflow: Overflow.visible,
                children: [
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
                          pokemonId: pokemonId,
                        ),
                        Text(
                          pokemonName.capitalize(),
                          style: POKEMON_NAME_TEXT_STYLE,
                        ),
                        PokemonTypesContainer(
                          types: pokemonTypes,
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: POSITIONED_IMAGE_TOP,
                    right: 0,
                    left: 0,
                    child: CachedNetworkImage(
                      imageUrl: pokemonImage,
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  ),
                ],
              ),
            ),
            if (onRemove != null)
              Positioned(
                bottom: POSITIONED_ICON_BOTTOM,
                right: 0,
                left: 0,
                child: RemoveButton(
                  onTap: onRemove,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
