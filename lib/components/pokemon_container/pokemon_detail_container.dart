import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pokedex/components/pokemon_container/pokemon_id.dart';
import 'package:pokedex/components/pokemon_container/pokemon_types_container.dart';
import 'package:pokedex/components/pokemon_container/remove_button.dart';
import 'package:pokedex/constants/constants.dart';
import 'package:pokedex/screens/party/view_model/party_view_model.dart';
import 'package:pokedex/utils/extensions/string_extension.dart';
import 'package:pokedex/utils/svg_utils.dart';
import 'package:provider/provider.dart';

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
  FocusNode textNode = FocusNode();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    controller.text = widget.pokemonName.capitalize();

    Widget pokemonName() {
      if (widget.updateName != null) {
        return EditableText(
          style: POKEMON_NAME_TEXT_STYLE,
          controller: controller,
          autocorrectionTextRectColor: Colors.black,
          autocorrect: false,
          backgroundCursorColor: Colors.black,
          focusNode: textNode,
          cursorColor: Colors.black,
          selectionColor: Colors.white,
          textAlign: TextAlign.center,
          onSubmitted: (String value) {
            String newName = value;
            if(value.isNullOrEmpty) {
              newName = widget.pokemonName;
            } else {
              controller.text = newName;
              widget.updateName(newName);
            }
          },
        );
      } else {
        return Text(
          widget?.pokemonName?.capitalize() ?? "",
          style: POKEMON_NAME_TEXT_STYLE,
        );
      }
    }

    Consumer containerDetailsWidget =
        Consumer<PartyViewModel>(builder: (context, viewModel, child) {
      return Stack(
        children: [
          Container(
            decoration: POKEMON_CONTAINER.copyWith(
              border: (widget.onRemove != null ||
                      viewModel.pokemonIsInParty(widget.pokemonId))
                  ? Border.all(
                      color: Colors.green,
                    )
                  : null,
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
          IgnorePointer(
            ignoring: true,
            child: Padding(
              padding: const EdgeInsets.all(kMarginXXXS),
              child: Opacity(
                opacity: TWENTY_PERCENT_OPACITY,
                child: Container(
                  decoration: POKEMON_CONTAINER.copyWith(
                    color: CONTAINER_BACKGROUND,
                  ),
                ),
              ),
            ),
          ),
        ],
      );
    });

    return Padding(
      padding: const EdgeInsets.only(top: kMarginL),
      child: Container(
        height: POKEMON_WIDGET_HEIGHT,
        width: POKEMON_WIDGET_WIDTH,
        padding: const EdgeInsets.symmetric(vertical: kMarginXXXL),
        child: Stack(
          overflow: Overflow.visible,
          children: [
            InkWell(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                await widget.onAdd?.call();
                setState(() {});
              },
              child: Stack(
                overflow: Overflow.visible,
                children: [
                  containerDetailsWidget,
                  Positioned(
                    top: POSITIONED_IMAGE_TOP,
                    left: 0,
                    right: 0,
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
                left: 0,
                right: 0,
                child: RemoveButton(
                  onTap: () {
                    widget.onRemove?.call();
                    setState(() {});
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
