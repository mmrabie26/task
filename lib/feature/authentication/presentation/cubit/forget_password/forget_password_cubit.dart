import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/feature/authentication/presentation/cubit/forget_password/forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  // late final AuthRemoteDataSource _authRemoteDataSource;
  // late final AuthRepo _authRepo;
  // late final ForgetPasswordUseCase _forgetPasswordUseCase;
  // late final ResetPasswordUseCase _resetPasswordUseCase;

  ForgetPasswordCubit() : super(ForgetPasswordState()) {
    // _authRemoteDataSource = AuthRemoteDataSourceImplementation();
    // _authRepo = AuthRepoImplementation(_authRemoteDataSource);
    // _forgetPasswordUseCase = ForgetPasswordUseCase(_authRepo);
    // _resetPasswordUseCase = ResetPasswordUseCase(_authRepo);
  }
}
