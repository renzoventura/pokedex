import 'package:flutter/material.dart';
import 'package:pokedex/constants/constants.dart';
import 'package:pokedex/constants/enums.dart';
import 'package:pokedex/screens/dex/view_model/dex_view_model.dart';
import 'package:pokedex/utils/extensions/enum_extension.dart';
import 'package:provider/provider.dart';

class SortingDropdown extends StatefulWidget {
  @override
  _SortingDropdownState createState() => _SortingDropdownState();
}

class _SortingDropdownState extends State<SortingDropdown> {
  @override
  Widget build(BuildContext context) {
    return Consumer<DexViewModel>(builder: (context, dexViewModel, child) {
      return Column(
        children: [
          Text(
            SORT_BY,
            style: SORT_BY_TEXT_STYLE,
          ),
          IgnorePointer(
            ignoring: dexViewModel.isBusy,
            child: DropdownButton<SortingValues>(
                value: dexViewModel.initialValue,
                onChanged: (SortingValues newValue) {
                  dexViewModel.initialValue = newValue;
                  dexViewModel.sortPokemon();
                },
                items: SortingValues.values.map((SortingValues classType) {
                  return DropdownMenuItem<SortingValues>(
                    value: classType,
                    child: Text(
                      classType.toStringValue(),
                      style: SORT_BY_VALUES_TEXT_STYLE,
                    ),
                  );
                }).toList()),
          )
        ],
      );
    });
  }
}
