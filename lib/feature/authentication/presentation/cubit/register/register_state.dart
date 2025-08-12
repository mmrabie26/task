import 'package:equatable/equatable.dart';
import 'package:task/core/constants/enums.dart';

class RegisterState extends Equatable {
  final RequestState status;
  final String firstName;
  final String secondName;
  final String email;
  final String phone;
  final String country;
  final String gender;
  final String otpCode;
  final String password;
  final String confirmPassword;
  final bool showPassword;
  final bool showConfirmPassword;
  final String errorMessage;
  final bool isValidFirstName;
  final bool isValidSecondName;
  final bool isValidEmail;
  final bool isValidPhone;
  final bool isValidPassword;
  final bool isValidConfirmPassword;

  const RegisterState({
    required this.country,
    this.status = RequestState.initial,
    this.firstName = '',
    this.secondName = '',
    this.email = '',
    this.phone = '',
    this.otpCode = '',
    this.gender = 'male',
    this.password = '',
    this.confirmPassword = '',
    this.errorMessage = '',
    this.showPassword = true,
    this.showConfirmPassword = true,
    this.isValidFirstName = false,
    this.isValidSecondName = false,
    this.isValidEmail = false,
    this.isValidPhone = false,
    this.isValidPassword = false,
    this.isValidConfirmPassword = false,
  });

  bool get isRegisterSubmitValid =>
      isValidFirstName &&
      isValidSecondName &&
      isValidEmail &&
      isValidPhone &&
      isValidPassword &&
      isValidConfirmPassword;

  RegisterState copyWith({
    RequestState? status,
    String? firstName,
    String? secondName,
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
    bool? isValidFirstName,
    bool? isValidSecondName,
    bool? isValidEmail,
    bool? isValidPhone,
    bool? isValidPassword,
    bool? isValidConfirmPassword,
  }) => RegisterState(
    status: status ?? this.status,
    firstName: firstName ?? this.firstName,
    secondName: secondName ?? this.secondName,
    email: email ?? this.email,
    phone: phone ?? this.phone,
    otpCode: otpCode ?? this.otpCode,
    country: country ?? this.country,
    gender: gender ?? this.gender,
    password: password ?? this.password,
    confirmPassword: confirmPassword ?? this.confirmPassword,
    errorMessage: errorMessage ?? this.errorMessage,
    showConfirmPassword: showConfirmPassword ?? this.showConfirmPassword,
    showPassword: showPassword ?? this.showPassword,
    isValidFirstName: isValidFirstName ?? this.isValidFirstName,
    isValidSecondName: isValidSecondName ?? this.isValidSecondName,
    isValidEmail: isValidEmail ?? this.isValidEmail,
    isValidPhone: isValidPhone ?? this.isValidPhone,
    isValidPassword: isValidPassword ?? this.isValidPassword,
    isValidConfirmPassword: isValidConfirmPassword ?? this.isValidConfirmPassword,
  );

  @override
  // TODO: implement props
  List<Object?> get props => [
    status,
    firstName,
    secondName,
    email,
    phone,
    otpCode,
    country,
    gender,
    password,
    confirmPassword,
    errorMessage,
    showPassword,
    showConfirmPassword,
    isValidFirstName,
    isValidSecondName,
    isValidEmail,
    isValidPhone,
    isValidPassword,
    isValidConfirmPassword,
  ];
}
