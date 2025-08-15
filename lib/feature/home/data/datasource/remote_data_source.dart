import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:task/core/error/exceptions.dart';
import 'package:task/core/error/failure.dart';
import 'package:task/core/network/firebase_helper.dart';
import 'package:task/core/services/local_storage_service.dart';
import 'package:task/feature/authentication/data/models/register_model.dart';
import 'package:task/feature/home/data/models/user_model.dart';

abstract class HomeRemoteDataSource {
  Future<void> signOut();

  Future<List<UserModel>> getAllUser();

}

class HomeRemoteDataSourceImplementation extends HomeRemoteDataSource {
  final FirebaseHelper firebaseHelper;

  HomeRemoteDataSourceImplementation({required this.firebaseHelper});

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

  @override
  Future<void> signOut() async{
    try {
      await firebaseHelper.signOut();
      LocalStorageService().setLoginStatus(false);
      throw ServerException(Failure('login by email error'));
    } on ServerException catch (e) {
      rethrow;
    } catch (e) {
      throw ServerException(Failure(e.toString()));
    }
  }


}
