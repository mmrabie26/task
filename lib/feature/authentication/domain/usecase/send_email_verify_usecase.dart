
import 'package:dartz/dartz.dart';
import 'package:task/core/error/failure.dart';
import 'package:task/feature/authentication/domain/repositories/auth_repo.dart';

class SendEmailVerifyUseCase {
  final AuthRepo _authRepo;

  SendEmailVerifyUseCase(this._authRepo);

  Future<Either<Failure, bool>> call() => _authRepo.sendEmailVerify();
}
