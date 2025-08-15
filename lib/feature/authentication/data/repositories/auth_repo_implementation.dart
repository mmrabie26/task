import 'dart:io';
import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:task/core/error/exceptions.dart';
import 'package:task/core/error/failure.dart';
import 'package:task/feature/authentication/data/datasource/remote_data_source.dart';
import 'package:task/feature/authentication/data/models/register_model.dart';
import 'package:task/feature/authentication/domain/entities/register_entity.dart';
import 'package:task/feature/authentication/domain/repositories/auth_repo.dart';
import 'package:task/feature/home/data/models/user_model.dart';
import 'package:task/feature/home/domain/entities/user_entity.dart';

class AuthRepoImplementation extends AuthRepo {
  final AuthRemoteDataSource _authRemoteDataSource;

  AuthRepoImplementation(this._authRemoteDataSource);

  @override
  Future<Either<Failure, String>> signUp(UserEntity userEntity,String password,File? image) async{
    try{
     final response= await _authRemoteDataSource.signUp(UserModel.fromEntity(userEntity),password,image);
     return right(response);
    }catch (e){
      if(e is ServerException){
        return left(e.failure);
      }
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> checkEmailVerify() async{
    try{
      final response= await _authRemoteDataSource.checkEmailVerify();
      return right(response);
    }catch(e){
      if(e is ServerException) return left(e.failure);
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> sendEmailVerify() async{
    try{
      final response= await _authRemoteDataSource.checkEmailVerify();
      return right(response);
    }catch(e){
      if(e is ServerException) return left(e.failure);
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> login(String email, String password) async{
    try{
      final response= await _authRemoteDataSource.login(email, password);
      return right(response);
    }catch(e){
      if(e is ServerException) return left(e.failure);
      return left(Failure(e.toString()));
    }

  }



}
