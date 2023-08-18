import '../enums/template_type.dart';

abstract class Template {
  final String name;
  final TemplateType type;
  final Map<String, String> params;

  const Template(
    this.name, {
    required this.type,
    this.params = const {},
  });
}
