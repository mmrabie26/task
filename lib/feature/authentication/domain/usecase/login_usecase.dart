
import 'package:task/feature/authentication/domain/repositories/auth_repo.dart';

class LoginUseCase {
  final AuthRepo _authRepo;
  LoginUseCase(this._authRepo);

  // Future<Either<Failure, UserEntity>> call(String email, String password) =>
  //     _authRepo.login(email, password);
}
