import 'package:dartz/dartz.dart';
import 'package:task/core/error/failure.dart';
import 'package:task/feature/authentication/domain/repositories/auth_repo.dart';
import 'package:task/feature/home/domain/entities/user_entity.dart';
import 'package:task/feature/home/domain/repositories/home_repo.dart';

class SignOutUseCase {
  final HomeRepo _homeRepo;

  SignOutUseCase(this._homeRepo);

  Future<Either<Failure, void>> call() => _homeRepo.signOut();
}
