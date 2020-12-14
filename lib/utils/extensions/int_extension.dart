extension IntExtension on int {
  String toPokemonNumber() {
    if (this == null) {
      return "";
    } else {
      int value = this.abs();
      if (value.toString().length == 1) {
        return "#00$value";
      } else if (this.toString().length == 2) {
        return "#0$value";
      }
      return "#$value";
    }
  }
}
