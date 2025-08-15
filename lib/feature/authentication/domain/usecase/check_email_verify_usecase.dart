
import 'package:dartz/dartz.dart';
import 'package:task/core/error/failure.dart';
import 'package:task/feature/authentication/domain/repositories/auth_repo.dart';

class CheckEmailVerifyUseCase {
  final AuthRepo _authRepo;

  CheckEmailVerifyUseCase(this._authRepo);

  Future<Either<Failure, bool>> call() => _authRepo.checkEmailVerify();
}
