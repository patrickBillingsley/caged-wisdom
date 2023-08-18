/// An enum for deciding what course of action to take
enum Action {
  generate('generate');

  final String value;

  const Action(this.value);

  /// Returns an [Action] from the given string.
  /// String can be abbreviated, e.g., 'generate' and 'g' both return [Action.generate].
  /// If there is no match, it throws an [UnimplementedError].
  static Action fromString(String string) {
    switch (string) {
      case 'generate':
      case 'g':
        return generate;
      default:
        throw UnimplementedError('$string is not a valid Action');
    }
  }
}
