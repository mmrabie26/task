import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:task/feature/home/data/models/user_model.dart';

class FirebaseHelper {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance.collection('users');
  final _storage = FirebaseStorage.instance..ref();

  Future<UserCredential> registerByEmail(String email, String password) async {
    return await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<UserCredential> login(String email, String password) async {
    return await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> signOut() async {
      return await _auth.signOut();
  }

  Future<bool> checkEmailVerify() async {
    await _auth.currentUser!.reload();
    return _auth.currentUser!.emailVerified;
  }

  Future<bool> sendEmailVerify() async {
    try {
      await FirebaseAuth.instance.currentUser!.reload();
      if (_auth.currentUser != null) {
        await _auth.currentUser!.sendEmailVerification();
        return true;
      } else {
        return false;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> addUser(UserModel userModel) async {
    try {
      await _firestore.doc(userModel.id).set(userModel.toJson());
    } catch (e) {
      rethrow;
    }
  }

  Future<UserModel> getUser(String userId) async {
    try {
      DocumentSnapshot<Map<String, dynamic>> doc = await _firestore
          .doc(userId)
          .get();
      if (doc.exists) {
        return UserModel.fromJson(doc.data()!);
      } else {
        throw 'user not register';
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<String> uploadUserImage(File image,String userId)async{
    try{
      final ref= _storage.ref('users_image/$userId}');
      await ref.putFile(image);
      return ref.getDownloadURL();
    }catch(e){
      rethrow;
    }
  }

  Future<List<UserModel>> getAllUsers() async {
    try {
      QuerySnapshot snapshot = await _firestore.get();

      List<UserModel> users = snapshot.docs.map((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        data['id'] = doc.id;
        return UserModel.fromJson(data);
      }).toList();

      return users;
    } catch (e) {
      print("Error getting users: $e");
      return [];
    }
  }

}

