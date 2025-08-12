
import 'package:task/feature/authentication/domain/repositories/auth_repo.dart';

class VerifyOtpCodeUseCase {
  final AuthRepo _authRepo;

  VerifyOtpCodeUseCase(this._authRepo);

  // Future<Either<Failure, bool>> call({required String email, required String otpCode}) {
  //   return _authRepo.verifyOtpCode(email: email, otpCode: otpCode);
}
