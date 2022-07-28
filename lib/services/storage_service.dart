import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class StorageService {
  StorageService({required this.uid});
  final String uid;

  FirebaseStorage storage = FirebaseStorage.instance;
  Future<String> uploadFile(String filepath) async {
    try {
      final dateTime = DateTime.now().toIso8601String();
      final ref = storage.ref("$uid/$dateTime");
      final uploadTask = await ref.putFile(File(filepath));
      return await uploadTask.ref.getDownloadURL();
    } catch (e) {
      print("error occured");
    }
    return "";
  }
}
