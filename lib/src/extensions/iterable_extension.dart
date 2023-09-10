/// An extension on [Iterable] with a subtype of [String].
extension IterableExtension on Iterable<String> {
  /// Returns the result of converting an [Iterable] of [String]s into a [Map] of [String] key value pairs.
  /// If there are more or fewer than one(1) `:`, this will throw a RangeError.
  Map<String, String> toMap() {
    final result = <String, String>{};

    for (final param in this) {
      final parts = param.split(':');

      if (parts.length != 2) {
        throw RangeError.range(parts.length, 2, 2, 'SyntaxError', '$param is malformed.');
      }

      result[parts[0]] = parts[1];
    }

    return result;
  }
}
