





import 'dart:io';
import 'dart:typed_data';

import 'package:path_provider/path_provider.dart';

abstract class StorageFirebaseBase{

  Future<String?> createQRLink(String iban);

  Future<File> saveImage(ByteData data, String name);

  Future<String?> getPhotoLink(File? photo);

   Future<String> get localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> saveFile(ByteData data, String name,String type);

  Future<String?> getFileLink(File? file);
}