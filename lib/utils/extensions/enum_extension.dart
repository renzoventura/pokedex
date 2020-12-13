import 'package:pokedex/constants/enums.dart';

extension EnumExtension on SortingValues {
  String toStringValue() {
    if (this == null) {
      return "";
    }
    return (this.toString().substring(this.toString().indexOf('.') + 1));
  }
}
