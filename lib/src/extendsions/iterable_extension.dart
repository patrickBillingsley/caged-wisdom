extension IterableExtension on Iterable<String> {
  Map<String, String> toMap() {
    Map<String, String> result = {};

    for (final param in this) {
      final List<String> parts = param.split(':');

      if (parts.length != 2) {
        throw RangeError.range(parts.length, 2, 2, 'SyntaxError', '$param is malformed.');
      }

      result[parts[0]] = parts[1];
    }

    return result;
  }
}
