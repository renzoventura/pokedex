// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pokemon _$PokemonFromJson(Map<String, dynamic> json) {
  return Pokemon()
    ..name = json['name'] as String
    ..url = json['url'] as String;
}

Map<String, dynamic> _$PokemonToJson(Pokemon instance) =>
    <String, dynamic>{'name': instance.name, 'url': instance.url};
