import 'package:equatable/equatable.dart';
import 'package:task/core/constants/enums.dart';

class OtpState extends Equatable {
  final VerifyEmailState status;
  final bool emailVerify;
  final int resendCounter;
  final String errorMessage;

  const OtpState({
    this.status = VerifyEmailState.initial,
    this.emailVerify=false,
    this.resendCounter=0,
    this.errorMessage = '',
  });

  OtpState copyWith({
    VerifyEmailState? status,
    bool? emailVerify,
    int? resendCounter,
    String? errorMessage,
  }) => OtpState(
    status: status ?? this.status,
    emailVerify: emailVerify ?? this.emailVerify,
    resendCounter: resendCounter?? this.resendCounter,
    errorMessage: errorMessage ?? this.errorMessage,
  );

  @override
  List<Object?> get props => [status, emailVerify, resendCounter,errorMessage];
}
