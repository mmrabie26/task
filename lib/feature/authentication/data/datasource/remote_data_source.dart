import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:task/core/error/exceptions.dart';
import 'package:task/core/error/failure.dart';
import 'package:task/core/network/firebase_helper.dart';
import 'package:task/feature/authentication/data/models/register_model.dart';
import 'package:task/feature/home/data/models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<String> signUp(UserModel userModel, String password,File? image);

  Future<UserModel> login(String email, String password);

  Future<bool> checkEmailVerify();

  Future<bool> sendEmailVerify();

  Future<List<UserModel>> getAllUser();


  // Future<String> forgetPassword(String email);

  // Future<bool> resetPassword(String email, String otpCode, String password);
}

class AuthRemoteDataSourceImplementation extends AuthRemoteDataSource {
  final FirebaseHelper firebaseHelper;

  AuthRemoteDataSourceImplementation({required this.firebaseHelper});

  @override
  Future<String> signUp(UserModel userModel, String password,File? image) async {
    try {
      final response = await firebaseHelper.registerByEmail(
        userModel.email,
        password,
      );
      if (response.user != null) {
        userModel.id = response.user!.uid;
        // await response.user!.sendEmailVerification();
        if(image!=null){
          await firebaseHelper.uploadUserImage(image, response.user!.uid).then((url){
           userModel.image=url;
         },);
        }
        await firebaseHelper.addUser(userModel);
        return response.user!.uid;
      }
      throw ServerException(Failure('register by email error'));
    } on ServerException catch (e) {
      rethrow;
    } catch (e) {
      throw ServerException(Failure(e.toString()));
    }
  }

  @override
  Future<bool> checkEmailVerify() async {
    try {
      return await firebaseHelper.checkEmailVerify();
    } catch (e) {
      throw ServerException(Failure(e.toString()));
    }
  }

  @override
  Future<bool> sendEmailVerify() async {
    try {
      return await firebaseHelper.sendEmailVerify();
    } catch (e) {
      throw ServerException(Failure(e.toString()));
    }
  }

  @override
  Future<UserModel> login(String email, String password) async {
    try {
      final response = await firebaseHelper.login(email, password);
      if (response.user != null) {
        return await firebaseHelper.getUser(response.user!.uid);
      }
      throw ServerException(Failure('login by email error'));
    } on ServerException catch (e) {
      rethrow;
    } catch (e) {
      throw ServerException(Failure(e.toString()));
    }
  }

  @override
  Future<List<UserModel>> getAllUser() async{
    try {
      return await firebaseHelper.getAllUsers();
    } on ServerException catch (e) {
      rethrow;
    } catch (e) {
      throw ServerException(Failure(e.toString()));
    }
  }


}
