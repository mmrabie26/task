import 'package:flutter/material.dart';
import 'package:task/feature/authentication/presentation/widgets/register_body.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const RegisterBody(),
    );
  }
} 