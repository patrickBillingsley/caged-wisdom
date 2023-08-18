import 'package:caged_wisdom/src/enums/template_type.dart';
import 'package:caged_wisdom/src/extendsions/string_extension.dart';
import 'package:caged_wisdom/src/templates/template.dart';

class ModelTemplate extends Template {
  const ModelTemplate(
    super.name, {
    super.type = TemplateType.model,
    super.params,
  });

  String buildImports() {
    return 'import \'package:caged_wisdom/src/models/${type.toFileName()}.dart\';\n import \'package:caged_wisdom/src/types.dart\';';
  }

  String buildDeclaration() {
    return 'class ${name.toPascalCase()} extends $type {';
  }

  String buildParams() {
    final List<String> types = List.from(params.keys);
    final List<String> names = List.from(params.values);

    String result = '';
    for (var i = 0; i < types.length; i++) {
      final String type = types[i];
      final String param = names[i].toCamelCase();
      result = '$result\nfinal $type $param;';
    }

    return result;
  }

  String buildConstructor() {
    final List<String> args = List.from(params.values);
    final className = name.toPascalCase();
    final opening = 'const $className({';

    String result = '';
    for (var i = 0; i < args.length; i++) {
      result = result + 'required this.${args[i]},';
    }

    return opening + result + '});';
  }

  String buildFromJson() {
    final List<String> args = List.from(params.values);
    final className = name.toPascalCase();
    final opening = '$className fromJson(Json json) {\n return $className(';

    String result = '';
    for (var i = 0; i < args.length; i++) {
      final paramName = args[i].toCamelCase();
      final jsonHandle = args[i].toSnakeCase();

      result = '$result $paramName: json[\'$jsonHandle\'],';
    }

    return opening + result + ');}';
  }

  // ModelTemplate fromJson(Json json) {
  //   return ModelTemplate(
  //     json['name'],
  //     type: json['type'],
  //     params: json['params'],
  //   );
  // }

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
