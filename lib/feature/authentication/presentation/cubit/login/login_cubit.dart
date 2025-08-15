import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/core/constants/enums.dart';
import 'package:task/core/network/firebase_helper.dart';
import 'package:task/core/services/local_storage_service.dart';
import 'package:task/core/utils/validators.dart';
import 'package:task/feature/authentication/data/datasource/remote_data_source.dart';
import 'package:task/feature/authentication/data/repositories/auth_repo_implementation.dart';
import 'package:task/feature/authentication/domain/repositories/auth_repo.dart';
import 'package:task/feature/authentication/domain/usecase/login_usecase.dart';
import 'package:task/feature/authentication/presentation/cubit/login/login_state.dart';
import 'package:task/feature/home/domain/entities/user_entity.dart';

class LoginCubit extends Cubit<LoginState> {
  late final AuthRemoteDataSource _authRemoteDataSource;
  late final AuthRepo _authRepo;
  late final LoginUseCase _loginUseCase;

  LoginCubit() : super(LoginState()) {
    _authRemoteDataSource = AuthRemoteDataSourceImplementation(firebaseHelper: FirebaseHelper());
    _authRepo = AuthRepoImplementation(_authRemoteDataSource);
    _loginUseCase = LoginUseCase(_authRepo);
  }

  showPassword() => emit(
    state.copyWith(
      showPassword: !state.showPassword,
      status: RequestState.initial,
    ),
  );

  whenEmailChange(String email) {
    final valid = Validators.emailValidation(email);
    if (!valid) {
      emit(
        state.copyWith(
          email: email,
          isValidEmail: valid,
          errorMessage: null,
          status: RequestState.initial,
        ),
      );
      return;
    }
    emit(
      state.copyWith(
        email: email,
        isValidEmail: valid,
        errorMessage: null,
        status: RequestState.initial,
      ),
    );
  }

  whenPasswordChange(String password) {
    final valid = Validators.passwordValidation(password);
    if (!valid) {
      emit(
        state.copyWith(
          password: password,
          isValidPassword: valid,
          errorMessage: null,
          status: RequestState.initial,
        ),
      );
      return;
    }
    emit(
      state.copyWith(
        password: password,
        isValidPassword: valid,
        errorMessage: null,
        status: RequestState.initial,
      ),
    );
  }

  loginSubmit() async {
    try {
      emit(state.copyWith(status: RequestState.loading));

      final response = await _loginUseCase.call(state.email,state.password);
      await response.fold(
            (failure) {
          emit(
            state.copyWith(
              errorMessage: failure.message,
              status: RequestState.error,
            ),
          );
        },
            (user) async{
              await LocalStorageService().addUser(user);
          emit(state.copyWith(status: RequestState.loaded));
        },
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: RequestState.error,
          errorMessage: "failure when login try again",
        ),
      );
    }
  }


}
