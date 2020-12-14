import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:pokedex/components/pokemon_container/pokemon_detail_container.dart';
import 'package:pokedex/constants/constants.dart';
import 'package:pokedex/models/pokemon_details.dart';
import 'package:pokedex/screens/dex/view_model/dex_view_model.dart';
import 'package:pokedex/screens/party/view_model/party_view_model.dart';
import 'package:provider/provider.dart';

class PokedexListContainer extends StatefulWidget {
  final int gridSize;

  const PokedexListContainer({Key key, this.gridSize: MINIMUM_GRID_SIZE})
      : super(key: key);
  @override
  _PokedexListContainerState createState() => _PokedexListContainerState();
}

class _PokedexListContainerState extends State<PokedexListContainer> {
  ScrollController controller;

  void _scrollListener() {
    DexViewModel dexViewModel =
        Provider.of<DexViewModel>(context, listen: false);
    if (controller.position.extentAfter < SCROLL_THRESHOLD &&
        !dexViewModel.isBusy) {
      dexViewModel.getPokemons();
    }
  }

  @override
  void initState() {
    Future.microtask(() {
      Provider.of<DexViewModel>(context, listen: false).init();
      Provider.of<PartyViewModel>(context, listen: false).updatePokemon();
    });
    controller = new ScrollController()..addListener(_scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DexViewModel>(
      builder: (context, dexViewModel, child) {
        List<Widget> getPokemonList() {
          List<Widget> pokemonWidgets = [];
          if (dexViewModel.pokemonDetails != null) {
            for (PokemonDetails pokemon in dexViewModel.pokemonDetails) {
              pokemonWidgets.add(PokemonDetailContainer(
                onAdd: () async {
              await Provider.of<PartyViewModel>(context, listen: false)
                  .addPokemonToParty(pokemon);
                },
                pokemonId: pokemon.id,
                pokemonName: pokemon.name,
                pokemonTypes: pokemon.types.map((e) => e.type.name).toList(),
                pokemonImage: pokemon.sprites.frontDefault,
              ));
            }
          }
          return pokemonWidgets;
        }

        return ModalProgressHUD(
          inAsyncCall:
              (dexViewModel.isBusy && dexViewModel.pokemonDetails.isEmpty),
          progressIndicator: CircularProgressIndicator(),
          child: Stack(
            children: [
              Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      controller: controller,
                      child: Wrap(
                        direction: Axis.horizontal,
                        runSpacing: 10,
                        spacing: 10,
                        children: getPokemonList(),
                      ),
                    ),
                  ),
                ],
              ),
              if (dexViewModel.isBusy && dexViewModel.pokemonDetails.isNotEmpty)
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.all(kMargin),
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.transparent,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
