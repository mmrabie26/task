
import 'package:task/feature/authentication/domain/repositories/auth_repo.dart';

class SendOtpUseCase {
  final AuthRepo _authRepo;

  SendOtpUseCase(this._authRepo);

  // Future<Either<Failure, bool>> call({required String phone, required String otpCode}) {
  //   return _authRepo.sendOtpCode(phone: phone, otpCode: otpCode);
}
