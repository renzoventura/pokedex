import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pokedex/components/pokemon_container/pokemon_id.dart';
import 'package:pokedex/components/pokemon_container/pokemon_types_container.dart';
import 'package:pokedex/components/pokemon_container/remove_button.dart';
import 'package:pokedex/constants/constants.dart';
import 'package:pokedex/data/moor_database.dart';
import 'package:pokedex/di/setup_dependencies.dart';
import 'package:pokedex/utils/extensions/string_extension.dart';
import 'package:pokedex/utils/svg_utils.dart';

class PokemonDetailContainer extends StatefulWidget {
  final String pokemonName;
  final int pokemonId;
  final List<String> pokemonTypes;
  final Function onAdd;
  final String pokemonImage;
  final Function onRemove;
  final bool isSelected;
  final Function(String) updateName;
  const PokemonDetailContainer({
    Key key,
    @required this.pokemonName,
    @required this.pokemonId,
    @required this.pokemonTypes,
    @required this.pokemonImage,
    this.onAdd,
    this.onRemove,
    this.isSelected = false,
    this.updateName,
  }) : super(key: key);

  @override
  _PokemonDetailContainerState createState() => _PokemonDetailContainerState();
}

class _PokemonDetailContainerState extends State<PokemonDetailContainer> {
  TextEditingController controller = TextEditingController();
  FocusNode textNode = FocusNode();
  bool isNotSelected = true;
  @override
  void initState() {
    controller.text = widget.pokemonName.capitalize();
    Future.microtask(() async {
      isNotSelected = await getIt<AppDatabase>().isNotInParty(widget.pokemonId);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Border getDecoration() {
      if (widget.onRemove != null || widget.isSelected) {
        return Border.all(
          color: Colors.green,
        );
      }
      return null;
    }

    Widget pokemonName() {
      if (widget.updateName != null) {
        return EditableText(
          style: POKEMON_NAME_TEXT_STYLE,
          controller: controller,
          autocorrectionTextRectColor: Colors.black,
          backgroundCursorColor: Colors.black,
          focusNode: textNode,
          cursorColor: Colors.black,
          selectionColor: Colors.black,
          textAlign: TextAlign.center,
          onSubmitted: (value) {
            widget.updateName(value);
          },
        );
      } else {
        return Text(
          widget.pokemonName.capitalize(),
          style: POKEMON_NAME_TEXT_STYLE,
        );
      }
    }

    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(
            horizontal: kMarginS, vertical: kMarginXXXL),
        child: Stack(
          overflow: Overflow.visible,
          children: [
            InkWell(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                await widget.onAdd?.call();
                isNotSelected =
                    await getIt<AppDatabase>().isNotInParty(widget.pokemonId);
                setState(() {});
              },
              child: Stack(
                overflow: Overflow.visible,
                children: [
                  Container(
                    decoration: POKEMON_CONTAINER.copyWith(
                      border: getDecoration(),
                    ),
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
                          pokemonId: widget.pokemonId,
                        ),
                        pokemonName(),
                        PokemonTypesContainer(
                          types: widget.pokemonTypes,
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: POSITIONED_IMAGE_TOP,
                    right: 0,
                    left: 0,
                    child: CachedNetworkImage(
                      imageUrl: widget.pokemonImage,
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  ),
                ],
              ),
            ),
            if (widget.onRemove != null)
              Positioned(
                bottom: POSITIONED_ICON_BOTTOM,
                right: 0,
                left: 0,
                child: RemoveButton(
                  onTap: widget.onRemove,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
