import 'package:json_annotation/json_annotation.dart';

part 'pokemon.g.dart';

@JsonSerializable()
class Pokemon {
    Pokemon();

    String name;
    String url;
    
    factory Pokemon.fromJson(Map<String,dynamic> json) => _$PokemonFromJson(json);
    Map<String, dynamic> toJson() => _$PokemonToJson(this);
}
