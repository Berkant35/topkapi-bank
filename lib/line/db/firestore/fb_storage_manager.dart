import 'dart:io';

import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:topkapi_bank/line/db/firestore/fb_storage_base.dart';

import '../../../main.dart';

class FirebaseStorageManager extends StorageFirebaseBase {


  @override
  Future<String?> createQRLink(String iban) async {
    try {
      ByteData? qrBytes = await QrPainter(
        data: iban,
        gapless: true,
        version: QrVersions.auto,
      ).toImageData(878);

      if (qrBytes != null) {
        File qrFile = await saveImage(qrBytes, iban);

        final firebaseStorageRef = FirebaseStorage.instance.ref(qrFile.path);
        UploadTask uploadTask = firebaseStorageRef.putFile(qrFile);
        TaskSnapshot taskSnapshot = await uploadTask;
        var createdUrl = await taskSnapshot.ref.getDownloadURL();
        return createdUrl;
      } else {
        return null;
      }
    } catch (e) {
      logger.e('$e<-err');
      return null;
    }
  }

  @override
  Future<String?> getFileLink(File? file) async {
    try {
      final firebaseStorageRef = FirebaseStorage.instance.ref(file?.path);
      if (file != null) {
        UploadTask uploadTask = firebaseStorageRef.putFile(file);
        TaskSnapshot taskSnapshot = await uploadTask;
        var createdUrl = await taskSnapshot.ref.getDownloadURL();
        return createdUrl;
      } else {
        return null;
      }
    } catch (e) {
      logger.e('$e<-err');
      return null;
    }
  }

  @override
  Future<File> saveFile(ByteData data, String name, String type) async {
    var path = await localPath; //<-- see below function

    final buffer = data.buffer;
    return File('$path/$name.$type').writeAsBytes(
        buffer.asUint8List(data.offsetInBytes, data.lengthInBytes));
  }

  @override
  Future<File> saveImage(ByteData data, String name) async {
    var path = await localPath; //<-- see below function

    final buffer = data.buffer;
    return File('$path/$name.png').writeAsBytes(
        buffer.asUint8List(data.offsetInBytes, data.lengthInBytes));
  }

  @override
  Future<String?> getPhotoLink(File? photo) async {
    try {
      final firebaseStorageRef = FirebaseStorage.instance.ref(photo?.path);
      if (photo != null) {
        UploadTask uploadTask = firebaseStorageRef.putFile(photo);
        TaskSnapshot taskSnapshot = await uploadTask;
        var createdUrl = await taskSnapshot.ref.getDownloadURL();
        return createdUrl;
      } else {
        return null;
      }
    } catch (e) {
      logger.e('$e<-err');
      return null;
    }
  }
}
