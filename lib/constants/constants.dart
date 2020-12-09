import 'package:flutter/material.dart';

//labels
const POKEDEX = "POKEDEX";
const PARTY = "PARTY";
const CHOOSE_TEAM = "Choose \n your team";

//margins
const double kMarginXXXS = 2.0;
const double kMarginXXS = 4.0;
const double kMarginXS = 8.0;
const double kMarginS = 12.0;
const double kMargin = 16.0;
const double kMarginPlus = 18.0;
const double kMarginL = 20.0;
const double kMarginXL = 24.0;
const double kMarginXXL = 28.0;
const double kMarginXXXL = 32.0;
const double kMarginXXXXL = 36.0;
const double kMarginXXXXXL = 40.0;

//sizedBox
const double appbarLabelPadding = 52.0;

//custom margins mobile
const double logoAppBarLeadingMobilePadding = 28;
const double logoAppBarEndingMobilePadding = 20;

//custom margins mobile

//opacity
const double FULL_OPACITY = 1.0;
const double SIXTY_PERCENT_OPACITY = 0.6;

//sizes
const double APP_BAR_PROFILE_RADIUS = 20;
const double DRAWER_PROFILE_RADIUS = 50;
const double POKEMON_CONTAINER_HEIGHT = 154;
const double POKEMON_CONTAINER_WIDTH = 152;
const double POKEMON_ID_HEIGHT = 18;
const double POKEMON_ID_WIDTH = 44;

//border radius
const double kBorderRadiusS = 4.0;
const double kBorderRadiusM = 12.0;
const double kBorderRadius = 20.0;

//styling
const TextStyle APP_BAR_LABEL_TEXT_STYLE = TextStyle(
  fontFamily: 'WorkSans',
  fontWeight: FontWeight.w700,
);
const TextStyle DRAWER_LABEL_TEXT_STYLE = TextStyle(
  fontFamily: 'WorkSans',
  fontWeight: FontWeight.w700,
  fontSize: 24,
  color: Colors.white,
);
const TextStyle drawerIcon = TextStyle(
  fontFamily: 'WorkSans',
  fontWeight: FontWeight.w700,
  fontSize: 30,
);
const TextStyle CHOOSE_YOUR_TEAM_TEXT_STYLE = TextStyle(
  fontFamily: 'Moret',
  fontWeight: FontWeight.w700,
  fontSize: 36,
);
const TextStyle POKEMON_NAME_TEXT_STYLE = TextStyle(
  fontFamily: 'Moret',
  fontWeight: FontWeight.w400,
  fontSize: 24,
);
const TextStyle POKEMON_ID_TEXT_STYLE = TextStyle(
  fontFamily: 'WorkSans',
  fontWeight: FontWeight.w700,
  fontSize: 10,
  color: Color(0xff000000),
);
const TextStyle POKEMON_TYPE_TEXT_STYLE = TextStyle(
  fontFamily: 'WorkSans',
  fontWeight: FontWeight.w700,
  fontSize: 10,
  color: Color(0xffFFFFFF),
);

//decoration

const BoxDecoration POKEMON_CONTAINER = BoxDecoration(
  color: CONTAINER_BACKGROUND,
    borderRadius: BorderRadius.all(
      Radius.circular(kBorderRadiusM),
    ));

const BoxDecoration POKEMON_ID_CONTAINER = BoxDecoration(
    color: POKEMON_ID_COLOR,
    borderRadius: BorderRadius.all(
      Radius.circular(kBorderRadius),
    ));

const BoxDecoration POKEMON_TYPE_CONTAINER = BoxDecoration(
    borderRadius: BorderRadius.all(
      Radius.circular(kBorderRadiusS),
    ));

//colors
const Color PRIMARY_COLOR = Color(0xff333333);
const Color POKEMON_ID_COLOR = Color(0xffE0E0E0);

//pokemon per page
const int POKEMON_LIST_LIMIT = 10;
const int MINIMUM_GRID_SIZE = 2;

//threshold
const int SCROLL_THRESHOLD = 500;

//duration
const int FADE_IN_DURATION = 500;

//pokemon container specific
const double OVERLAY_DISTANCE = -42.0;
const double HALF_POKEBALL_WIDTH = 64;
const Color CONTAINER_BACKGROUND = Color(0xffF5F5F5);
