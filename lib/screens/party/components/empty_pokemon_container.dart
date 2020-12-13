import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/constants/constants.dart';
import 'package:pokedex/utils/image_utils.dart';

class EmptyPokemonContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: kMarginS,
            vertical: kMarginXXXL,
        ),
        child: Stack(
          overflow: Overflow.visible,
          children: [
            Container(
              decoration: POKEMON_CONTAINER,
              height: POKEMON_CONTAINER_HEIGHT,
              width: POKEMON_CONTAINER_WIDTH,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: kMarginPlus),
                    child: Container(
                      decoration: floatingButtonDecoration,
                      child: CircleAvatar(
                        radius: POKEBALL_PLACEHOLDER_RADIUS,
                        backgroundColor: CONTAINER_BACKGROUND,
                        child: Icon(
                          Icons.add,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: POSITIONED_POKEBALL_TOP,
              right: 0,
              left: 0,
              child: Image.asset(
                ImageUtils.POKEBALL,
                height: EMPTY_POKEBALL_PLACEHOLDER_RADIUS,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
