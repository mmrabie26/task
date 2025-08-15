import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:task/core/error/failure.dart';
import 'package:task/feature/authentication/domain/entities/register_entity.dart';
import 'package:task/feature/home/data/models/user_model.dart';
import 'package:task/feature/home/domain/entities/user_entity.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<UserEntity>>> getAllUser();

  Future<Either<Failure, void>> signOut();

}
