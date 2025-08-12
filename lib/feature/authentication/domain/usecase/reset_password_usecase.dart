
import 'package:task/feature/authentication/domain/repositories/auth_repo.dart';

class ResetPasswordUseCase {
  final AuthRepo _authRepo;
  ResetPasswordUseCase(this._authRepo);

  // Future<Either<Failure, bool>> call(String email, String otpCode, String password) =>
  //     _authRepo.resetPassword(email, otpCode, password);
}
