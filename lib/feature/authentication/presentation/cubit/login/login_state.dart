import 'package:equatable/equatable.dart';
import 'package:task/core/constants/enums.dart';

class LoginState extends Equatable {
  final RequestState status;
  final String email;
  final String password;
  final bool showPassword;
  final String errorMessage;
  final bool isValidEmail;
  final bool isValidPassword;

  const LoginState({
    this.status = RequestState.initial,
    this.email = '',
    this.password = '',
    this.errorMessage = '',
    this.showPassword = true,
    this.isValidEmail = false,
    this.isValidPassword = false,
  });

  bool get isLoginSubmitValid => isValidEmail && isValidPassword;

  LoginState copyWith({
    RequestState? status,
    String? email,
    String? password,
    String? errorMessage,
    bool? showPassword,
    bool? isValidEmail,
    bool? isValidPassword,
  }) => LoginState(
    status: status ?? this.status,
    email: email ?? this.email,
    password: password ?? this.password,
    errorMessage: errorMessage ?? this.errorMessage,
    showPassword: showPassword ?? this.showPassword,
    isValidEmail: isValidEmail ?? this.isValidEmail,
    isValidPassword: isValidPassword ?? this.isValidPassword,
  );

  @override
  // TODO: implement props
  List<Object?> get props => [
    status,
    email,
    password,
    errorMessage,
    showPassword,
    isValidEmail,
    isValidPassword,
  ];
}
