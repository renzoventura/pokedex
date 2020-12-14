import 'package:flutter/material.dart';
import 'package:pokedex/constants/constants.dart';
import 'package:pokedex/utils/image_utils.dart';

class EmptyPokemonContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: kMarginL),
      child: Container(
        height: POKEMON_WIDGET_HEIGHT,
        width: POKEMON_WIDGET_WIDTH,
        padding: const EdgeInsets.symmetric(
          vertical: kMarginXXXL,
        ),
        child: Stack(
          overflow: Overflow.visible,
          children: [
            Stack(
              children: [
                Container(
                  decoration: POKEMON_CONTAINER,
                  height: POKEMON_WIDGET_HEIGHT,
                  width: POKEMON_WIDGET_WIDTH,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: kMarginPlus),
                        child: Container(
                          decoration: floatingButtonDecoration,
                          child: CircleAvatar(
                            radius: POKEBALL_PLACEHOLDER_BORDER_RADIUS,
                            backgroundColor: Colors.white,
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
                      ),
                    ],
                  ),
                ),
                Padding(
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
              ],
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
