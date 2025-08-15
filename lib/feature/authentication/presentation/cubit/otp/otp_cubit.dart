import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/core/constants/enums.dart';
import 'package:task/core/network/firebase_helper.dart';
import 'package:task/feature/authentication/data/datasource/remote_data_source.dart';
import 'package:task/feature/authentication/data/repositories/auth_repo_implementation.dart';
import 'package:task/feature/authentication/domain/repositories/auth_repo.dart';
import 'package:task/feature/authentication/domain/usecase/check_email_verify_usecase.dart';
import 'package:task/feature/authentication/domain/usecase/send_email_verify_usecase.dart';
import 'package:task/feature/authentication/presentation/cubit/otp/otp_state.dart';

class OtpCubit extends Cubit<OtpState> {
  late final AuthRemoteDataSource _authRemoteDataSource;
  late final AuthRepo _authRepo;
  late final SendEmailVerifyUseCase _sendEmailVerifyUseCase;
  late final CheckEmailVerifyUseCase _checkEmailVerifyUseCase;

  OtpCubit() : super(OtpState()) {
    _authRemoteDataSource = AuthRemoteDataSourceImplementation(
      firebaseHelper: FirebaseHelper(),
    );
    _authRepo = AuthRepoImplementation(_authRemoteDataSource);
    _sendEmailVerifyUseCase = SendEmailVerifyUseCase(_authRepo);
    _checkEmailVerifyUseCase = CheckEmailVerifyUseCase(_authRepo);
  }

  Future<void> checkEmailVerify() async {
    try {
      final response = await _checkEmailVerifyUseCase.call();
      response.fold(
          (failure) {
            emit(state.copyWith(status: VerifyEmailState.error,errorMessage: failure.message));
          },
          (isVerify) {
            if(isVerify) emit(state.copyWith(status: VerifyEmailState.verify));
            if(!isVerify) emit(state.copyWith(status: VerifyEmailState.notVerify));
          },
      );
    } catch (e) {
      emit(state.copyWith(status: VerifyEmailState.error,errorMessage: "error when verify email"));
    }
  }

  Future<void> resendEmailVerify() async {
    try {
      if (state.resendCounter == 0) {
        final response = await _sendEmailVerifyUseCase.call();
        response.fold((failure) {
        }, (isSend) {
        });

        emit(state.copyWith(status: VerifyEmailState.initial, resendCounter: 60));
        Timer.periodic(const Duration(seconds: 1), (timer) {
          if (state.resendCounter > 0) {
            emit(state.copyWith(resendCounter: state.resendCounter - 1,status: VerifyEmailState.initial));
          } else {
            timer.cancel();
          }
        });
      }
    } catch (e) {
      print('Error in resendEmailVerify: $e');
    }
  }

}
