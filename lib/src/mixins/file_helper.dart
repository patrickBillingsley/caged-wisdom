import 'dart:io';

import 'package:logging/logging.dart';

/// A mixin to help with file generation and formatting
mixin FileHelper {
  final _log = Logger('FileHelper');

  /// Generates a file at the given path with the given contents.
  /// The file is subsequently formatted.
  void generateFile({required String path, required String contents}) {
    File(path)
      ..createSync(recursive: true)
      ..writeAsStringSync(contents);

    formatFile(path);
  }

  /// Formats the file located at the given path.
  /// Logs if attempt was successful or not.
  void formatFile(String filePath) async {
    var result = await Process.run('dart', ['format', '--fix', filePath]);
    if (result.exitCode == 0) {
      _log.info('$filePath formatted successfully.');
    } else {
      _log.warning('Error formatting file: ${result.stderr}');
    }
  }
}
