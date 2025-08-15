import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/core/constants/enums.dart';
import 'package:task/core/network/firebase_helper.dart';
import 'package:task/core/services/select_image.dart';
import 'package:task/core/utils/validators.dart';
import 'package:task/feature/authentication/data/datasource/remote_data_source.dart';
import 'package:task/feature/authentication/data/repositories/auth_repo_implementation.dart';
import 'package:task/feature/authentication/domain/entities/register_entity.dart';
import 'package:task/feature/authentication/domain/repositories/auth_repo.dart';
import 'package:task/feature/authentication/domain/usecase/signup_usecase.dart';
import 'package:task/feature/authentication/presentation/cubit/register/register_state.dart';
import 'package:task/feature/home/domain/entities/user_entity.dart';

class RegisterCubit extends Cubit<RegisterState> {
  late final AuthRemoteDataSource _authRemoteDataSource;
  late final AuthRepo _authRepo;
  late final SignUpUseCase _signUpUseCase;

  // late final SendOtpUseCase _sendOtpCodeUseCase;

  RegisterCubit() : super(RegisterState()) {
    _authRemoteDataSource = AuthRemoteDataSourceImplementation(
      firebaseHelper: FirebaseHelper(),
    );
    _authRepo = AuthRepoImplementation(_authRemoteDataSource);
    _signUpUseCase = SignUpUseCase(_authRepo);
    // _sendOtpCodeUseCase = SendOtpUseCase(_authRepo);
  }

  showPassword() => emit(
    state.copyWith(
      showPassword: !state.showPassword,
      status: RequestState.initial,
    ),
  );

  showConfirmPassword() => emit(
    state.copyWith(
      showConfirmPassword: !state.showConfirmPassword,
      status: RequestState.initial,
    ),
  );

  whenChangeImage()async{
    final image= await pickAndEditImage();
    if(image!=null){
      emit(state.copyWith(image: image,status: RequestState.initial));
    }
  }

  whenNameChange(String name) {
    final valid = Validators.nameValidation(name);
    if (!valid) {
      emit(
        state.copyWith(
          name: name,
          isValidEmail: valid,
          errorMessage: null,
          status: RequestState.initial,
        ),
      );
      return;
    }
    emit(
      state.copyWith(
        name: name,
        isValidName: valid,
        errorMessage: null,
        status: RequestState.initial,
      ),
    );
  }

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

  whenPhoneChange(String phone) {
    final valid = Validators.phoneValidation(phone);
    if (!valid) {
      emit(
        state.copyWith(
          phone: phone,
          isValidPhone: valid,
          errorMessage: null,
          status: RequestState.initial,
        ),
      );
      return;
    }
    emit(
      state.copyWith(
        phone: phone,
        isValidPhone: valid,
        errorMessage: null,
        status: RequestState.initial,
      ),
    );
  }

  whenGenderChange(String gender) {
    emit(
      state.copyWith(
        gender: gender,
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
  void whenConfirmPasswordChange(String confirmPassword) {
    final isValidConfirm = Validators.passwordValidation(confirmPassword);

    // لو كلمة المرور غير صالحة أو التأكيد غير صالح
    if (!isValidConfirm) {
      emit(
        state.copyWith(
          confirmPassword: confirmPassword,
          isValidConfirmPassword: false,
          errorMessage: 'كلمة المرور غير صالحة',
          status: RequestState.initial,
        ),
      );
      return;
    }

    // لو كلمة المرور والتأكيد مختلفين
    if (confirmPassword != state.password) {
      emit(
        state.copyWith(
          confirmPassword: confirmPassword,
          isValidConfirmPassword: false,
          errorMessage: 'كلمة المرور لا تطابق التأكيد',
          status: RequestState.initial,
        ),
      );
      return;
    }

    // لو كل شيء تمام
    emit(
      state.copyWith(
        confirmPassword: confirmPassword,
        isValidConfirmPassword: true,
        errorMessage: null,
        status: RequestState.initial,
      ),
    );
  }

  registerSubmit() async {
    try {
      emit(state.copyWith(status: RequestState.loading));
      final UserEntity userEntity = UserEntity(
        id: '',
        name: state.name,
        email: state.email,
        phone: state.phone,
        gender: state.gender,
      );

      final response = await _signUpUseCase.call(userEntity,state.password,state.image);
      response.fold(
        (failure) {
          emit(
            state.copyWith(
              errorMessage: failure.message,
              status: RequestState.error,
            ),
          );
        },
        (r) {
          emit(state.copyWith(status: RequestState.loaded));
        },
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: RequestState.error,
          errorMessage: "faliure when register try again",
        ),
      );
    }
  }
}
