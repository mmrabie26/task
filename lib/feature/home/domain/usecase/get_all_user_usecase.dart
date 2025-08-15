import 'package:dartz/dartz.dart';
import 'package:task/core/error/failure.dart';
import 'package:task/feature/authentication/domain/repositories/auth_repo.dart';
import 'package:task/feature/home/domain/entities/user_entity.dart';

class GetAllUserUseCase {
  final AuthRepo _authRepo;

  GetAllUserUseCase(this._authRepo);

  Future<Either<Failure, List<UserEntity>>> call() => _authRepo.getAllUser();
}
