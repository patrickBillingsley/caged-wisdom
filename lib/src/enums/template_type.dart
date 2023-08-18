import 'package:caged_wisdom/src/extendsions/string_extension.dart';

/// An enum defining the available [Generator] templates.
enum TemplateType {
  model('Model');

  final String value;

  const TemplateType(this.value);

  @override
  String toString() => value;

  /// Returns [name] converted to snakeCase.
  String get fileName => value.toSnakeCase();
}
