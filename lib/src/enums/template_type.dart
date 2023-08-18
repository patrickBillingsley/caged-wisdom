import 'package:caged_wisdom/src/extendsions/string_extension.dart';

enum TemplateType {
  model('Model');

  final String value;

  const TemplateType(this.value);

  @override
  String toString() => value;

  String get fileName => value.toSnakeCase();
}
