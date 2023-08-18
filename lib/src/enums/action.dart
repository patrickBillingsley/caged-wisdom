enum Action {
  generate('generate');

  final String value;

  const Action(this.value);

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
