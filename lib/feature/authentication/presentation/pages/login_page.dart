import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/feature/authentication/presentation/cubit/login/login_cubit.dart';
import 'package:task/feature/authentication/presentation/widgets/login_body.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginCubit>(
      create: (context) => LoginCubit(),
      child: Scaffold(
        body: LoginBody(),
      ),
    );
  }
}
