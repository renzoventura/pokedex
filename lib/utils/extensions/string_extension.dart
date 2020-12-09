extension StringExtension on String {
  bool get isNotNullOrNotEmpty => this != null || null != "";
  bool get isNullOrEmpty => this == null || null == "";

  String capitalize() => this.isNotNullOrNotEmpty
      ? "${this[0].toUpperCase()}${this.substring(1)} "
      : "";
}
