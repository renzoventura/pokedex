extension StringExtension on String {
  bool get isNotNullAndNotEmpty => this != null && this != "";
  bool get isNullOrEmpty => this == null || this == "";

  String capitalize() {
    if (isNullOrEmpty) return "";
    return this.isNotNullAndNotEmpty
        ? "${this[0].toUpperCase()}${this.substring(1)} "
        : "";
  }
}
