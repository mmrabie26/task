import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:task/core/constants/enums.dart';

class RegisterState extends Equatable {
  final RequestState status;
  final String name;
  final String email;
  final String phone;
  final String gender;
  final String otpCode;
  final String password;
  final String confirmPassword;
  final bool showPassword;
  final bool showConfirmPassword;
  final String errorMessage;
  final bool isValidName;
  final bool isValidEmail;
  final bool isValidPhone;
  final bool isValidPassword;
  final bool isValidConfirmPassword;
  File? image;

   RegisterState({
    this.status = RequestState.initial,
    this.name = '',
    this.email = '',
    this.phone = '',
    this.otpCode = '',
    this.gender = 'male',
    this.password = '',
    this.confirmPassword = '',
    this.errorMessage = '',
    this.showPassword = true,
    this.showConfirmPassword = true,
    this.isValidName = false,
    this.isValidEmail = false,
    this.isValidPhone = false,
    this.isValidPassword = false,
    this.isValidConfirmPassword = false,
    this.image,
  });

  bool get isRegisterSubmitValid =>
      isValidName &&
      isValidEmail &&
      isValidPhone &&
      isValidPassword &&
      isValidConfirmPassword;

  RegisterState copyWith({
    RequestState? status,
    String? name,
    String? email,
    String? phone,
    String? otpCode,
    String? country,
    String? gender,
    String? password,
    String? confirmPassword,
    String? errorMessage,
    bool? showPassword,
    bool? showConfirmPassword,
    bool? isValidName,
    bool? isValidSecondName,
    bool? isValidEmail,
    bool? isValidPhone,
    bool? isValidPassword,
    bool? isValidConfirmPassword,
    File? image,
  }) => RegisterState(
    status: status ?? this.status,
    name: name ?? this.name,
    email: email ?? this.email,
    phone: phone ?? this.phone,
    otpCode: otpCode ?? this.otpCode,
    gender: gender ?? this.gender,
    password: password ?? this.password,
    confirmPassword: confirmPassword ?? this.confirmPassword,
    errorMessage: errorMessage ?? this.errorMessage,
    showConfirmPassword: showConfirmPassword ?? this.showConfirmPassword,
    showPassword: showPassword ?? this.showPassword,
    isValidName: isValidName ?? this.isValidName,
    isValidEmail: isValidEmail ?? this.isValidEmail,
    isValidPhone: isValidPhone ?? this.isValidPhone,
    isValidPassword: isValidPassword ?? this.isValidPassword,
    isValidConfirmPassword: isValidConfirmPassword ?? this.isValidConfirmPassword,
    image: image ?? image,
  );

  @override
  // TODO: implement props
  List<Object?> get props => [
    status,
    name,
    email,
    phone,
    otpCode,
    gender,
    image,
    password,
    confirmPassword,
    errorMessage,
    showPassword,
    showConfirmPassword,
    isValidName,
    isValidEmail,
    isValidPhone,
    isValidPassword,
    isValidConfirmPassword,
  ];
}
