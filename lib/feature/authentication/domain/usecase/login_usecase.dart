
import 'package:dartz/dartz.dart';
import 'package:task/core/error/failure.dart';
import 'package:task/feature/authentication/domain/repositories/auth_repo.dart';
import 'package:task/feature/home/domain/entities/user_entity.dart';

class LoginUseCase {
  final AuthRepo _authRepo;
  LoginUseCase(this._authRepo);

  Future<Either<Failure, UserEntity>> call(String email, String password) =>
      _authRepo.login(email, password);
}
