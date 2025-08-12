
import 'package:task/feature/authentication/domain/repositories/auth_repo.dart';

class ForgetPasswordUseCase {
  final AuthRepo _authRepo;
  ForgetPasswordUseCase(this._authRepo);

  // Future<Either<Failure, String>> call(String email) => _authRepo.forgetPassword(email);
}
