import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/feature/authentication/presentation/cubit/forget_password/forget_password_cubit.dart';
import 'package:task/feature/authentication/presentation/widgets/forgot_password_body.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ForgetPasswordCubit>(
      create: (context) => ForgetPasswordCubit(),
      child: Scaffold(
        body: const ForgotPasswordBody(),
      ),
    );
  }
} 