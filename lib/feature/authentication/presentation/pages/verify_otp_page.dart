import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/feature/authentication/presentation/cubit/otp/otp_cubit.dart';
import 'package:task/feature/authentication/presentation/widgets/verify_otp_body.dart';

class VerifyOtpPage extends StatelessWidget {
  const VerifyOtpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<OtpCubit>(
      create: (context) => OtpCubit(),
      child: Scaffold(
        body: const VerifyOtpBody(),
      ),
    );
  }
} 