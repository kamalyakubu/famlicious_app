import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class FileUploadService {
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;

  // get async => null;

  Future<String?> uploadFile(
      {required File file, required String userUid}) async {
    try {
      String? downloadUrl;

      Reference storageRef =
          _firebaseStorage.ref().child("profile_images").child("$userUid.jpg");

      UploadTask storageUploadTask = storageRef.putFile(file);

      // storageUploadTask.whenComplete(() async{
      //   downloadUrl = await storageRef.getDownloadURL();

      TaskSnapshot snapshot = await storageUploadTask.whenComplete(() => storageRef.getDownloadURL());

      return await snapshot.ref.getDownloadURL();
      
      //     .ref()
      //     .child('profile_images')
      //     .child('$userUid.jpg')
      //     .putFile(file);
      // return storageUploadTask.snapshot.ref.getDownloadURL();
    } on FirebaseException catch (e) {
      // TODO
      // print(e.message);
      return null;
    }
  }
}
