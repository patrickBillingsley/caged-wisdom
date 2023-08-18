import 'package:caged_wisdom/src/generators/model_generator.dart';

enum Generators {
  model('Model', ModelGenerator);

  final String name;
  final Type generator;

  const Generators(
    this.name,
    this.generator,
  );

  @override
  String toString() => '${name}Generator';
}
