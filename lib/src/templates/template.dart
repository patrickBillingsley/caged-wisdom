import 'package:caged_wisdom/src/enums/template_type.dart';
import 'package:caged_wisdom/src/types.dart';

abstract class Template {
  final String name;
  final TemplateType type;
  final Params params;

  const Template(
    this.name, {
    required this.type,
    this.params = const {},
  });
}
