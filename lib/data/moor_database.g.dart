// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moor_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps
class PartyPokemon extends DataClass implements Insertable<PartyPokemon> {
  final int id;
  final int pokemonId;
  final String name;
  final String image;
  final String typeOne;
  final String typeTwo;
  PartyPokemon(
      {@required this.id,
      @required this.pokemonId,
      @required this.name,
      @required this.image,
      @required this.typeOne,
      this.typeTwo});
  factory PartyPokemon.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return PartyPokemon(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      pokemonId:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}pokemon_id']),
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
      image:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}image']),
      typeOne: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}type_one']),
      typeTwo: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}type_two']),
    );
  }
  factory PartyPokemon.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return PartyPokemon(
      id: serializer.fromJson<int>(json['id']),
      pokemonId: serializer.fromJson<int>(json['pokemonId']),
      name: serializer.fromJson<String>(json['name']),
      image: serializer.fromJson<String>(json['image']),
      typeOne: serializer.fromJson<String>(json['typeOne']),
      typeTwo: serializer.fromJson<String>(json['typeTwo']),
    );
  }
  @override
  Map<String, dynamic> toJson(
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return {
      'id': serializer.toJson<int>(id),
      'pokemonId': serializer.toJson<int>(pokemonId),
      'name': serializer.toJson<String>(name),
      'image': serializer.toJson<String>(image),
      'typeOne': serializer.toJson<String>(typeOne),
      'typeTwo': serializer.toJson<String>(typeTwo),
    };
  }

  @override
  T createCompanion<T extends UpdateCompanion<PartyPokemon>>(
      bool nullToAbsent) {
    return PartyPokemonsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      pokemonId: pokemonId == null && nullToAbsent
          ? const Value.absent()
          : Value(pokemonId),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      image:
          image == null && nullToAbsent ? const Value.absent() : Value(image),
      typeOne: typeOne == null && nullToAbsent
          ? const Value.absent()
          : Value(typeOne),
      typeTwo: typeTwo == null && nullToAbsent
          ? const Value.absent()
          : Value(typeTwo),
    ) as T;
  }

  PartyPokemon copyWith(
          {int id,
          int pokemonId,
          String name,
          String image,
          String typeOne,
          String typeTwo}) =>
      PartyPokemon(
        id: id ?? this.id,
        pokemonId: pokemonId ?? this.pokemonId,
        name: name ?? this.name,
        image: image ?? this.image,
        typeOne: typeOne ?? this.typeOne,
        typeTwo: typeTwo ?? this.typeTwo,
      );
  @override
  String toString() {
    return (StringBuffer('PartyPokemon(')
          ..write('id: $id, ')
          ..write('pokemonId: $pokemonId, ')
          ..write('name: $name, ')
          ..write('image: $image, ')
          ..write('typeOne: $typeOne, ')
          ..write('typeTwo: $typeTwo')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          pokemonId.hashCode,
          $mrjc(
              name.hashCode,
              $mrjc(image.hashCode,
                  $mrjc(typeOne.hashCode, typeTwo.hashCode))))));
  @override
  bool operator ==(other) =>
      identical(this, other) ||
      (other is PartyPokemon &&
          other.id == id &&
          other.pokemonId == pokemonId &&
          other.name == name &&
          other.image == image &&
          other.typeOne == typeOne &&
          other.typeTwo == typeTwo);
}

class PartyPokemonsCompanion extends UpdateCompanion<PartyPokemon> {
  final Value<int> id;
  final Value<int> pokemonId;
  final Value<String> name;
  final Value<String> image;
  final Value<String> typeOne;
  final Value<String> typeTwo;
  const PartyPokemonsCompanion({
    this.id = const Value.absent(),
    this.pokemonId = const Value.absent(),
    this.name = const Value.absent(),
    this.image = const Value.absent(),
    this.typeOne = const Value.absent(),
    this.typeTwo = const Value.absent(),
  });
  PartyPokemonsCompanion copyWith(
      {Value<int> id,
      Value<int> pokemonId,
      Value<String> name,
      Value<String> image,
      Value<String> typeOne,
      Value<String> typeTwo}) {
    return PartyPokemonsCompanion(
      id: id ?? this.id,
      pokemonId: pokemonId ?? this.pokemonId,
      name: name ?? this.name,
      image: image ?? this.image,
      typeOne: typeOne ?? this.typeOne,
      typeTwo: typeTwo ?? this.typeTwo,
    );
  }
}

class $PartyPokemonsTable extends PartyPokemons
    with TableInfo<$PartyPokemonsTable, PartyPokemon> {
  final GeneratedDatabase _db;
  final String _alias;
  $PartyPokemonsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _pokemonIdMeta = const VerificationMeta('pokemonId');
  GeneratedIntColumn _pokemonId;
  @override
  GeneratedIntColumn get pokemonId => _pokemonId ??= _constructPokemonId();
  GeneratedIntColumn _constructPokemonId() {
    return GeneratedIntColumn(
      'pokemon_id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _nameMeta = const VerificationMeta('name');
  GeneratedTextColumn _name;
  @override
  GeneratedTextColumn get name => _name ??= _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn(
      'name',
      $tableName,
      false,
    );
  }

  final VerificationMeta _imageMeta = const VerificationMeta('image');
  GeneratedTextColumn _image;
  @override
  GeneratedTextColumn get image => _image ??= _constructImage();
  GeneratedTextColumn _constructImage() {
    return GeneratedTextColumn(
      'image',
      $tableName,
      false,
    );
  }

  final VerificationMeta _typeOneMeta = const VerificationMeta('typeOne');
  GeneratedTextColumn _typeOne;
  @override
  GeneratedTextColumn get typeOne => _typeOne ??= _constructTypeOne();
  GeneratedTextColumn _constructTypeOne() {
    return GeneratedTextColumn(
      'type_one',
      $tableName,
      false,
    );
  }

  final VerificationMeta _typeTwoMeta = const VerificationMeta('typeTwo');
  GeneratedTextColumn _typeTwo;
  @override
  GeneratedTextColumn get typeTwo => _typeTwo ??= _constructTypeTwo();
  GeneratedTextColumn _constructTypeTwo() {
    return GeneratedTextColumn(
      'type_two',
      $tableName,
      true,
    );
  }

  @override
  List<GeneratedColumn> get $columns =>
      [id, pokemonId, name, image, typeOne, typeTwo];
  @override
  $PartyPokemonsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'party_pokemons';
  @override
  final String actualTableName = 'party_pokemons';
  @override
  VerificationContext validateIntegrity(PartyPokemonsCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.id.present) {
      context.handle(_idMeta, id.isAcceptableValue(d.id.value, _idMeta));
    } else if (id.isRequired && isInserting) {
      context.missing(_idMeta);
    }
    if (d.pokemonId.present) {
      context.handle(_pokemonIdMeta,
          pokemonId.isAcceptableValue(d.pokemonId.value, _pokemonIdMeta));
    } else if (pokemonId.isRequired && isInserting) {
      context.missing(_pokemonIdMeta);
    }
    if (d.name.present) {
      context.handle(
          _nameMeta, name.isAcceptableValue(d.name.value, _nameMeta));
    } else if (name.isRequired && isInserting) {
      context.missing(_nameMeta);
    }
    if (d.image.present) {
      context.handle(
          _imageMeta, image.isAcceptableValue(d.image.value, _imageMeta));
    } else if (image.isRequired && isInserting) {
      context.missing(_imageMeta);
    }
    if (d.typeOne.present) {
      context.handle(_typeOneMeta,
          typeOne.isAcceptableValue(d.typeOne.value, _typeOneMeta));
    } else if (typeOne.isRequired && isInserting) {
      context.missing(_typeOneMeta);
    }
    if (d.typeTwo.present) {
      context.handle(_typeTwoMeta,
          typeTwo.isAcceptableValue(d.typeTwo.value, _typeTwoMeta));
    } else if (typeTwo.isRequired && isInserting) {
      context.missing(_typeTwoMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PartyPokemon map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return PartyPokemon.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(PartyPokemonsCompanion d) {
    final map = <String, Variable>{};
    if (d.id.present) {
      map['id'] = Variable<int, IntType>(d.id.value);
    }
    if (d.pokemonId.present) {
      map['pokemon_id'] = Variable<int, IntType>(d.pokemonId.value);
    }
    if (d.name.present) {
      map['name'] = Variable<String, StringType>(d.name.value);
    }
    if (d.image.present) {
      map['image'] = Variable<String, StringType>(d.image.value);
    }
    if (d.typeOne.present) {
      map['type_one'] = Variable<String, StringType>(d.typeOne.value);
    }
    if (d.typeTwo.present) {
      map['type_two'] = Variable<String, StringType>(d.typeTwo.value);
    }
    return map;
  }

  @override
  $PartyPokemonsTable createAlias(String alias) {
    return $PartyPokemonsTable(_db, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(const SqlTypeSystem.withDefaults(), e);
  $PartyPokemonsTable _partyPokemons;
  $PartyPokemonsTable get partyPokemons =>
      _partyPokemons ??= $PartyPokemonsTable(this);
  @override
  List<TableInfo> get allTables => [partyPokemons];
}
