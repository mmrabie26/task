import 'package:equatable/equatable.dart';
import 'package:task/core/constants/enums.dart';

class OtpState extends Equatable {
  final RequestState status;
  final String? email;
  final String? phone;
  final String otpCode;
  final String errorMessage;

  final bool isValidVerifyCode;

  const OtpState({
    this.status = RequestState.initial,
    this.email = '',
    this.phone = '',
    this.errorMessage = '',
    this.otpCode = '',
    this.isValidVerifyCode = false,
  });

  // bool get isRegisterSubmitValid =>
  //     isValidSecondName &&
  //     isValidEmail &&
  //     isValidPhone &&
  //     isValidPassword &&
  //     isValidConfirmPassword;

  OtpState copyWith({
    RequestState? status,
    String? otpCode,
    String? email,
    String? phone,
    String? errorMessage,
    bool? isValidVerifyCode,
  }) => OtpState(
    status: status ?? this.status,
    email: email ?? this.email,
    phone: phone ?? this.phone,
    otpCode: otpCode ?? this.otpCode,
    errorMessage: errorMessage ?? this.errorMessage,
    isValidVerifyCode: isValidVerifyCode ?? this.isValidVerifyCode,
  );

  @override
  // TODO: implement props
  List<Object?> get props => [status, otpCode, email, phone, errorMessage, isValidVerifyCode];
}
