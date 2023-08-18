import 'dart:io';

mixin FileHelper {
  void generateFile({required String path, required String contents}) {
    File file = File(path);
    file.createSync(recursive: true);
    file.writeAsStringSync(contents);
    formatFile(path);
  }

  void formatFile(String filePath) async {
    var result = await Process.run('dart', ['format', '--fix', filePath]);
    if (result.exitCode == 0) {
      print('File formatted successfully.');
    } else {
      print('Error formatting file: ${result.stderr}');
    }
  }
}
