extension StringExtension on String {
  bool get isNotNullAndNotEmpty => this != null && null != "";
  bool get isNullOrEmpty => this == null || null == "";

  String capitalize() => this.isNotNullAndNotEmpty
      ? "${this[0].toUpperCase()}${this.substring(1)} "
      : "";
}
