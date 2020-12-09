import 'package:flutter/material.dart';
import 'package:pokedex/constants/constants.dart';
import 'package:pokedex/utils/extensions/string_extension.dart';

Color pokemonTypeColor(String typeName) {
  if (typeName.isNullOrEmpty) return POKEMON_ID_COLOR;
  switch (typeName.toUpperCase()) {
    case "NORMAL":
      return Color(0xffA8A77A);
      break;
    case "FIGHTING":
      return Color(0xffC22E28);
      break;
    case "FLYING":
      return Color(0xffA98FF3);
      break;
    case "POISON":
      return Color(0xffA33EA1);
      break;
    case "GROUND":
      return Color(0xffE2BF65);
      break;
    case "ROCK":
      return Color(0xffB6A136);
      break;
    case "BUG":
      return Color(0xffA6B91A);
      break;
    case "GHOST":
      return Color(0xff735797);
      break;
    case "STEEL":
      return Color(0xffB7B7CE);
      break;
    case "FIRE":
      return Color(0xffEE8130);
      break;
    case "WATER":
      return Color(0xff6390F0);
      break;
    case "GRASS":
      return Color(0xff7AC74C);
      break;
    case "ELECTRIC":
      return Color(0xffF7D02C);
      break;
    case "PSYCHIC":
      return Color(0xffF95587);
      break;
    case "ICE":
      return Color(0xff96D9D6);
      break;
    case "DRAGON":
      return Color(0xff6F35FC);
      break;
    case "DARK":
      return Color(0xff705746);
      break;
    case "FAIRY":
      return Color(0xffD685AD);
      break;
    case "UNKNOWN":
      return Color(0xff000000);
      break;
    case "SHADOW":
      return Color(0xff000000);
      break;
    default:
      return POKEMON_ID_COLOR;
  }
}
