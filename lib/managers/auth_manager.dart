import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:famlicious_app/services/file_upload_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthManager with ChangeNotifier {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  static final FirebaseFirestore _firebaseFirestore =
      FirebaseFirestore.instance;
  final FileUploadService _fileUploadService = FileUploadService();
  String _message = '';
  bool _isLoading = false;
  String get message => _message;
  bool get isLoading => _isLoading;
  CollectionReference userCollection = _firebaseFirestore.collection("users");

  

  setMessage(String message) {
    _message = message;

    notifyListeners();
  }

  setIsLoading(bool isLoading) {
    _isLoading = isLoading;

    notifyListeners();
  }

  //Authentication with email and password
  Future<bool> createNewUser(
      {
        required String name,
        required String email,
      required String password,
      required File imageFile}) async {
    _isLoading = true;
    bool isCreated = false;
    await _firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((userCredential) async {
      String? photoUrl = await _fileUploadService.uploadFile(
          file: imageFile, userUid: userCredential.user!.uid);

      if (photoUrl != null) {
        //Add user info to firestore (name,email,photo,uid,createdAt)
        await userCollection.doc(userCredential.user!.uid).set({
          "name": name,
          "email": email,
          "picture": photoUrl,
          "createdAt": FieldValue.serverTimestamp(),
          "userId": userCredential.user!.uid
        });
        isCreated = true;
      } else {
        setMessage('Image upload failed');
        isCreated = false;
      }
    }).catchError((onError) {
      setMessage('$onError');
      isCreated = false;
      setIsLoading(false);
    }).timeout(const Duration(seconds: 60), onTimeout: () {
      setMessage('Please check your internet connection');
      isCreated = false;
      setIsLoading(false);
    });

    return isCreated;
  }
}
