import 'package:flutter/material.dart';
import 'package:task/feature/authentication/presentation/widgets/verify_otp_body.dart';

class VerifyOtpPage extends StatelessWidget {
  const VerifyOtpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const VerifyOtpBody(),
    );
  }
} 