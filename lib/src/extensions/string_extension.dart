extension StringExtension on String {
  String capitalize() {
    return '${this[0].toUpperCase()}${substring(1)}';
  }

  String toCamelCase() {
    if (RegExp(r'^[a-z][a-zA-Z0-9]*$').hasMatch(this)) {
      return this; // Already in camelCase
    }
    return replaceAllMapped(RegExp(r'_([a-z])'), (match) => match.group(1)!.toUpperCase());
  }

  String toSnakeCase() {
    if (RegExp(r'^[a-z_][a-z0-9_]*$').hasMatch(this)) {
      return this; // Already in snake_case
    }
    return replaceAllMapped(RegExp(r'(?<=[a-z0-9])([A-Z])'), (match) => '_${match.group(1)!.toLowerCase()}').toLowerCase();
  }

  String toPascalCase() {
    if (RegExp(r'^[A-Z][a-zA-Z0-9]*$').hasMatch(this)) {
      return this; // Already in PascalCase
    }
    return replaceAllMapped(RegExp(r'_([a-z])'), (match) => match.group(1)!.toUpperCase()).capitalize();
  }
}
