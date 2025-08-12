import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/feature/authentication/presentation/cubit/register/register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  // late final AuthRemoteDataSource _authRemoteDataSource;
  // late final AuthRepo _authRepo;
  // late final SignUpUseCase _signUpUseCase;
  // late final SendOtpUseCase _sendOtpCodeUseCase;

  RegisterCubit() : super(RegisterState(country: 'Egypt')) {
    // _authRemoteDataSource = AuthRemoteDataSourceImplementation();
    // _authRepo = AuthRepoImplementation(_authRemoteDataSource);
    // _signUpUseCase = SignUpUseCase(_authRepo);
    // _sendOtpCodeUseCase = SendOtpUseCase(_authRepo);
  }
}
