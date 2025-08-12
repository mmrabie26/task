import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/feature/authentication/presentation/cubit/login/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  // late final AuthRemoteDataSource _authRemoteDataSource;
  // late final AuthRepo _authRepo;
  // late final LoginUseCase _loginUseCase;

  LoginCubit() : super(LoginState()) {
    // _authRemoteDataSource = AuthRemoteDataSourceImplementation();
    // _authRepo = AuthRepoImplementation(_authRemoteDataSource);
    // _loginUseCase = LoginUseCase(_authRepo);
  }
}
