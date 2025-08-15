import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:task/core/error/failure.dart';
import 'package:task/feature/authentication/domain/entities/register_entity.dart';
import 'package:task/feature/home/data/models/user_model.dart';
import 'package:task/feature/home/domain/entities/user_entity.dart';

abstract class AuthRepo {
  Future<Either<Failure, String>> signUp(UserEntity userEntity,String password,File? image);

  Future<Either<Failure, UserEntity>> login(String email, String password);

  Future<Either<Failure, bool>> checkEmailVerify();

  Future<Either<Failure, bool>> sendEmailVerify();


  // Future<Either<Failure, String>> forgetPassword(String email);
  //
  // Future<Either<Failure, bool>> resetPassword(String email, String otpCode, String password);
}
