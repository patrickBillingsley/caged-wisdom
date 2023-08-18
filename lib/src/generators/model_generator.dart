import 'package:caged_wisdom/src/extendsions/string_extension.dart';
import 'package:caged_wisdom/src/generators/generator.dart';
import 'package:caged_wisdom/src/templates/model_template.dart';

class ModelGenerator extends Generator {
  final String name;
  final Map<String, String> params;

  ModelGenerator(
    this.name, {
    this.params = const {},
  });

  @override
  void generate() {
    generateFile(
      path: 'build/lib/models/${name.toSnakeCase()}.dart',
      contents: ModelTemplate(name, params: params).build(),
    );
  }
}