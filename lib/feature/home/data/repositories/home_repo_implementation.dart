import 'dart:io';
import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:task/core/error/exceptions.dart';
import 'package:task/core/error/failure.dart';
import 'package:task/feature/authentication/data/datasource/remote_data_source.dart';
import 'package:task/feature/authentication/data/models/register_model.dart';
import 'package:task/feature/authentication/domain/entities/register_entity.dart';
import 'package:task/feature/authentication/domain/repositories/auth_repo.dart';
import 'package:task/feature/home/data/datasource/remote_data_source.dart';
import 'package:task/feature/home/data/models/user_model.dart';
import 'package:task/feature/home/domain/entities/user_entity.dart';
import 'package:task/feature/home/domain/repositories/home_repo.dart';

class HomeRepoImplementation extends HomeRepo {
  final HomeRemoteDataSource _homeRemoteDataSource;

  HomeRepoImplementation(this._homeRemoteDataSource);

  @override
  Future<Either<Failure, List<UserEntity>>> getAllUser() async{
    try{
      final response= await _homeRemoteDataSource.getAllUser();
      return right(response);
    }catch(e){
      if(e is ServerException) return left(e.failure);
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> signOut() async{
    try{
      final response= await _homeRemoteDataSource.signOut();
      return right(response);
    }catch(e){
      if(e is ServerException) return left(e.failure);
      return left(Failure(e.toString()));
    }
     }



}
