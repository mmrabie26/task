import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/feature/authentication/presentation/cubit/otp/otp_state.dart';

class OtpCubit extends Cubit<OtpState> {
  // late final AuthRemoteDataSource _authRemoteDataSource;
  // late final AuthRepo _authRepo;
  // late final VerifyOtpCodeUseCase _verifyOtpCodeUseCase;

  OtpCubit() : super(OtpState()) {
    // _authRemoteDataSource = AuthRemoteDataSourceImplementation();
    // _authRepo = AuthRepoImplementation(_authRemoteDataSource);
    // _verifyOtpCodeUseCase = VerifyOtpCodeUseCase(_authRepo);
  }
}
