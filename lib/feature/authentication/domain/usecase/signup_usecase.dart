import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:task/core/error/failure.dart';
import 'package:task/feature/authentication/domain/entities/register_entity.dart';
import 'package:task/feature/authentication/domain/repositories/auth_repo.dart';
import 'package:task/feature/home/data/models/user_model.dart';
import 'package:task/feature/home/domain/entities/user_entity.dart';

class SignUpUseCase {
  final AuthRepo _authRepo;

  SignUpUseCase(this._authRepo);

  Future<Either<Failure, String>> call(UserEntity userEntity, String password,File? image) =>
      _authRepo.signUp(userEntity, password,image);
}
