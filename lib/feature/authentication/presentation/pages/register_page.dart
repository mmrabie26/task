import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/feature/authentication/presentation/cubit/register/register_cubit.dart';
import 'package:task/feature/authentication/presentation/widgets/register_body.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RegisterCubit>(
      create: (context) => RegisterCubit(),
      child: Scaffold(
        body: const RegisterBody(),
      ),
    );
  }
} 