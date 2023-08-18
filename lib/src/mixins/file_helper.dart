import 'dart:io';

import 'package:logging/logging.dart';

mixin FileHelper {
  final _log = Logger('FileHelper');

  void generateFile({required String path, required String contents}) {
    File(path)
      ..createSync(recursive: true)
      ..writeAsStringSync(contents);

    formatFile(path);
  }

  void formatFile(String filePath) async {
    var result = await Process.run('dart', ['format', '--fix', filePath]);
    if (result.exitCode == 0) {
      _log.info('$filePath formatted successfully.');
    } else {
      _log.warning('Error formatting file: ${result.stderr}');
    }
  }
}
