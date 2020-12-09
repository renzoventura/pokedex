import 'package:flutter/material.dart';
import 'package:pokedex/constants/constants.dart';
import 'package:pokedex/models/pokemon_details.dart';
import 'file:///C:/Users/Renzo/Documents/RENZO/CV2020/pokedex/lib/components/pokemon_container/pokemon_detail_container.dart';
import 'package:pokedex/screens/dex/view_model/dex_view_model.dart';
import 'package:provider/provider.dart';

class PokemonListContainer extends StatefulWidget {
  final int gridSize;

  const PokemonListContainer({Key key, this.gridSize: MINIMUM_GRID_SIZE})
      : super(key: key);
  @override
  _PokemonListContainerState createState() => _PokemonListContainerState();
}

class _PokemonListContainerState extends State<PokemonListContainer> {
  ScrollController controller;

  void _scrollListener() {
    DexViewModel dexViewModel =
        Provider.of<DexViewModel>(context, listen: false);
    if (controller.position.extentAfter < SCROLL_THRESHOLD &&
        !dexViewModel.isBusy) {
      dexViewModel.getPokemonList();
    }
  }

  @override
  void initState() {
    Future.microtask(
      () => Provider.of<DexViewModel>(context, listen: false).init(),
    );
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
              pokemonWidgets
                  .add(PokemonDetailContainer(pokemonDetails: pokemon));
            }
          }
          return pokemonWidgets;
        }

        return (dexViewModel.isBusy && dexViewModel.pokemonDetails.isEmpty)
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                children: [
                  Expanded(
                    child: GridView.count(
                      controller: controller,
                      crossAxisCount: widget.gridSize,
            mainAxisSpacing: 78,
            children: getPokemonList(),
                    ),
                  ),
                  if (dexViewModel.isBusy)
                    Padding(
                      padding: const EdgeInsets.all(kMargin),
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  // Expanded(
                  //   child: ListView.builder
                  //     (
                  //       itemCount: dexViewModel.pokemonDetails.length,
                  //       itemBuilder: (BuildContext context, int index) {
                  //         return new Text(dexViewModel.pokemonDetails[index].name);
                  //       }
                  //   ),
                  // ),
                ],
              );
      },
    );
  }
}
