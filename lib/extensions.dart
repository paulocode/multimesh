extension StringExtensions on String {
  String capitalize() {
    if (isEmpty) return this;
    return '${this[0].toUpperCase()}${substring(1).toLowerCase()}';
  }

  String snakeToUpperCamelCase() {
    final parts = split('_');
    return parts.map((part) => part.capitalize()).join();
  }
}
