import 'package:selfrenew_space/selfrenew_flutter.dart';

class FileStorage {
  static Future<Directory> _getTemporaryDirectory() async {
    return await getTemporaryDirectory();
  }

  static Future<Directory> _getApplicationDocumentsDirectory() async {
    return await getApplicationDocumentsDirectory();
  }

  static Future<Directory> _getLibraryDirectory() async {
    return await getLibraryDirectory();
  }

  static Future<Directory> _getApplicationSupportDirectory() async {
    return await getApplicationSupportDirectory();
  }

  static Future<bool> hasFile(String fileName, StorageType type) async {
    File file = await _file(fileName, type);
    Log.info(file.path);
    return await file.exists();
  }

  static Future<File> create(String fileName, StorageType type) async {
    File file = await _file(fileName, type);
    bool exists = await file.exists();
    if (!exists) {
      await file.create();
    }

    return file;
  }

  static Future<void> createAsData(
    String fileName,
    String contents,
    StorageType type,
  ) async {
    File file = await create(fileName, type);
    await file.writeAsString(contents);
  }

  static Future<String> readAsData(
    String fileName,
    StorageType type,
  ) async {
    File file = await create(fileName, type);
    return await file.readAsString();
  }

  static Future<File> _file(
    String fileName,
    StorageType type,
  ) async {
    Directory directory = await _createDirectory(type);
    return File('${directory.path}/$fileName');
  }

  static Future<Directory> _createDirectory(StorageType type) async {
    Directory directory;
    if (type == StorageType.applicationSupportDirectory) {
      directory = await _getApplicationSupportDirectory();
    } else {
      directory = await _getTemporaryDirectory();
    }

    return directory;
  }
}
