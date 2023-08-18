import 'dart:collection';

import 'package:caged_wisdom/src/enums/action.dart';
import 'package:caged_wisdom/src/extendsions/iterable_extension.dart';
import 'package:caged_wisdom/src/generators/model_generator.dart';

void main(Iterable<String> arguments) {
  final args = Queue<String>.from(arguments);

  try {
    final action = Action.fromString(args.removeFirst());
    switch (action) {
      case Action.generate:
        final name = args.removeFirst();

        ModelGenerator(name, params: args.toMap()).generate();
        break;
    }
  } catch (error) {
    print(error);
  }
}

