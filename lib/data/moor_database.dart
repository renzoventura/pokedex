import 'package:moor_flutter/moor_flutter.dart';

part 'moor_database.g.dart';

class PartyPokemons extends Table {
  IntColumn get id => integer().autoIncrement()();
  // TextColumn get typeName =>
  //     text().nullable().customConstraint('NULL REFERENCES tags(name)')();
  IntColumn get pokemonId => integer()();
  TextColumn get name => text()();
  TextColumn get image => text()();
  TextColumn get typeOne => text()();
  TextColumn get typeTwo => text().nullable()();
}
//
// class PartyTypes extends Table {
//   TextColumn get name => text()();
//   IntColumn get typeId => integer()();
//   @override
//   Set<Column> get primaryKey => {name};
// }

// class PartyPokemonWithTypes {
//   final PartyPokemon partyPokemon;
//   final List<PartyType> partyType;
//
//   PartyPokemonWithTypes(
//       {@required this.partyPokemon, @required this.partyType});
// }

@UseMoor(tables: [PartyPokemons]) // PartyTypes])
class AppDatabase extends _$AppDatabase {
  AppDatabase()
      : super(FlutterQueryExecutor.inDatabaseFolder(
            path: 'db.sqlite', logStatements: true));

  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        //onCreate: {}, //default creates all tables
        //     onUpgrade: (migrator, from, to) async {
        //   if (from == 1) {
        //     await migrator.addColumn(partyPokemons, partyPokemons.typeName);
        //     await migrator.createTable(partyTypes);
        //   }
        // },
        beforeOpen: (db, details) async {
          await db.customStatement(
              "PRAGMA foreign_keys = ON"); //enable foreign keys
        },
      );

  //pokemon
  Future<bool> isNotInParty(int id) async =>
      (await (select(partyPokemons)..where((p) => p.pokemonId.equals(id))).get())
          .isEmpty;

  Stream<List<PartyPokemon>> watchParty() => select(partyPokemons).watch();
  Future<List<PartyPokemon>> getParty() => select(partyPokemons).get();
  Future insertPokemonToParty(PartyPokemon pokemon) =>
      into(partyPokemons).insert(pokemon);
  Future removePokemonFromParty(PartyPokemon pokemon) =>
      delete(partyPokemons).delete(pokemon);
  Future insertPokemonFromParty(PartyPokemon pokemon) =>
      update(partyPokemons).replace(pokemon);
  Future<int> getPartySize() async =>
      (await select(partyPokemons).get()).length;
  Future updatePokemonName(PartyPokemon pokemon) => update(partyPokemons).replace(pokemon);

  //types
  // Future insertTag(PartyType pokemon) => into(partyTypes).insert(pokemon);

  // //watch pokemon with type
  // Stream<List<PartyPokemonWithTypes>> watchPartyWithTag() =>
  //     select(partyPokemons)
  //         .join([
  //       leftOuterJoin(
  //           partyTypes, partyTypes.name.equalsExp(partyPokemons.typeName))
  //     ])
  //         .watch()
  //         .map((rows) {
  //       final groupedData = <PartyPokemon, List<PartyType>>{};
  //
  //       for (final row in rows) {
  //         final pokemons = row.readTable(partyPokemons);
  //         final types = row.readTable(partyTypes);
  //
  //         final list = groupedData.putIfAbsent(pokemons, () => []);
  //         if (types != null) list.add(types);
  //       }
  //       List<PartyPokemonWithTypes> pokemonTypes = [];
  //
  //       for (final entry in groupedData.entries) {
  //         pokemonTypes.add(
  //           PartyPokemonWithTypes(
  //             partyPokemon: entry.key,
  //             partyType: entry.value,
  //           ),
  //         );
  //       }
  //       return pokemonTypes;
  //       //
  //       // return PartyPokemonWithTypes(
  //       //   partyPokemon: row.readTable(partyPokemons),
  //       //   partyType: row.readTable(partyTypes),
  //       // );
  //     });
}
