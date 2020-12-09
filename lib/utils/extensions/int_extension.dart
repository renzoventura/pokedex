extension IntExtension on int {
  String toPokemonNumber() {
    if (this == null) {
      return "";
    } else {
      if (this.toString().length == 1) {
        return "#00$this";
      } else if (this.toString().length == 2) {
        return "#0$this";
      }
      return "#$this";
    }
  }
}
