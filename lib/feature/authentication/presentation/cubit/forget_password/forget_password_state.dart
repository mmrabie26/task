import 'package:equatable/equatable.dart';
import 'package:task/core/constants/enums.dart';

class ForgetPasswordState extends Equatable {
  final RequestState forgetPasswordStatus;
  final RequestState resetPasswordStatus;
  final String email;
  final String otpCode;
  final String password;
  final String confirmPassword;
  final bool showPassword;
  final bool showConfirmPassword;
  final String forgetPasswordErrorMessage;
  final String resetPasswordErrorMessage;
  final bool isValidEmail;
  final bool isValidPassword;
  final bool isValidConfirmPassword;

  const ForgetPasswordState({
    this.forgetPasswordStatus = RequestState.initial,
    this.resetPasswordStatus = RequestState.initial,
    this.email = '',
    this.otpCode = '',
    this.password = '',
    this.confirmPassword = '',
    this.forgetPasswordErrorMessage = '',
    this.resetPasswordErrorMessage = '',
    this.showPassword = true,
    this.showConfirmPassword = true,
    this.isValidEmail = false,
    this.isValidPassword = false,
    this.isValidConfirmPassword = false,
  });

  ForgetPasswordState copyWith({
    RequestState? forgetPasswordStatus,
    RequestState? resetPasswordStatus,
    String? email,
    String? otpCode,
    String? password,
    String? confirmPassword,
    String? forgetPasswordErrorMessage,
    String? resetPasswordErrorMessage,
    bool? showPassword,
    bool? showConfirmPassword,
    bool? isValidEmail,
    bool? isValidPassword,
    bool? isValidConfirmPassword,
  }) => ForgetPasswordState(
    forgetPasswordStatus: forgetPasswordStatus ?? this.forgetPasswordStatus,
    resetPasswordStatus: resetPasswordStatus ?? this.resetPasswordStatus,
    email: email ?? this.email,
    otpCode: otpCode ?? this.otpCode,
    password: password ?? this.password,
    confirmPassword: confirmPassword ?? this.confirmPassword,
    forgetPasswordErrorMessage: forgetPasswordErrorMessage ?? this.forgetPasswordErrorMessage,
    resetPasswordErrorMessage: resetPasswordErrorMessage ?? this.resetPasswordErrorMessage,
    showPassword: showPassword ?? this.showPassword,
    showConfirmPassword: showConfirmPassword ?? this.showConfirmPassword,
    isValidEmail: isValidEmail ?? this.isValidEmail,
    isValidPassword: isValidPassword ?? this.isValidPassword,
    isValidConfirmPassword: isValidConfirmPassword ?? this.isValidConfirmPassword,
  );

  @override
  // TODO: implement props
  List<Object?> get props => [
    forgetPasswordStatus,
    resetPasswordStatus,
    email,
    otpCode,
    password,
    confirmPassword,
    forgetPasswordErrorMessage,
    resetPasswordErrorMessage,
    showPassword,
    showConfirmPassword,
    isValidEmail,
    isValidPassword,
    isValidConfirmPassword,
  ];
}
