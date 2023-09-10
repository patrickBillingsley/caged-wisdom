import 'package:caged_wisdom/src/enums/template_type.dart';
import 'package:caged_wisdom/src/extensions/string_extension.dart';
import 'package:caged_wisdom/src/templates/template.dart';

class ModelTemplate extends Template {
  late Iterable<String> _imports;

  ModelTemplate(
    super.name, {
    super.type = TemplateType.model,
    super.params,
  }) {
    _imports = [
      'import \'package:caged_wisdom/src/models/${type.fileName}.dart\';',
      'import \'package:caged_wisdom/src/types.dart\';'
    ];
  }

  String buildImports() {
    return _imports.reduce((value, import) => '$value\n$import');
  }

  String buildDeclaration() {
    return 'class ${name.toPascalCase()} extends $type {';
  }

  String buildParams() {
    final types = params.keys.toList();
    final names = params.values.toList();

    var result = '';
    for (var i = 0; i < types.length; i++) {
      final type = types[i];
      final param = names[i].toCamelCase();

      result = '$result\nfinal $type $param;';
    }

    return result;
  }

  String buildConstructor() {
    final args = params.values.toList();
    final className = name.toPascalCase();
    final opening = 'const $className({';

    String result = '';
    for (var i = 0; i < args.length; i++) {
      result = '$result required this.${args[i]},';
    }

    return '$opening$result});';
  }

  String buildFromJson() {
    final args = params.values.toList();
    final className = name.toPascalCase();
    final opening = '$className fromJson(Json json) {\n return $className(';

    String result = '';
    for (var i = 0; i < args.length; i++) {
      final paramName = args[i].toCamelCase();
      final jsonHandle = args[i].toSnakeCase();

      result = '$result $paramName: json[\'$jsonHandle\'],';
    }

    return '$opening$result);}';
  }

  String build() {
    return '''
      ${buildImports()}

      ${buildDeclaration()}
      ${buildParams()}

      ${buildConstructor()}

      ${buildFromJson()}
      }
    ''';
  }
}
