
import 'package:task/feature/authentication/domain/repositories/auth_repo.dart';

class SignUpUseCase {
  final AuthRepo _authRepo;
  SignUpUseCase(this._authRepo);

  // Future<Either<Failure, String>> call(RegisterEntity registerEntity) {
  //   return _authRepo.signUp(registerEntity);
}
