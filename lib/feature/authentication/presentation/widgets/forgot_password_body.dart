import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:task/app/router/app_router.dart';
import 'package:task/core/constants/app_strings.dart';
import 'package:task/core/constants/spacing.dart';
import 'package:task/core/constants/text_styles.dart';
import 'package:task/feature/authentication/presentation/widgets/auth_text_from_field.dart';

class ForgotPasswordBody extends StatelessWidget {
  const ForgotPasswordBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(Spacing.s24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: Spacing.s48),
            
            Center(
              child: Column(
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: Icon(
                      Icons.lock_reset,
                      size: 40,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  const SizedBox(height: Spacing.s24),
                  Text(
                    AppString.forgotPasswordTitle.tr(),
                    style: TextStyles.textStyle24.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: Spacing.s16),
                  Text(
                    AppString.enterEmailToReceiveOtp.tr(),
                    style: TextStyles.textStyle16.copyWith(
                      color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: Spacing.s48),

            authTextFromField(
              label: AppString.email.tr(),
              hint: AppString.enterEmailAddress.tr(),
              icon: Icons.email_outlined,
              keyboardType: TextInputType.emailAddress,
            ),
            
            const SizedBox(height: Spacing.s32),
            
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: () => context.go(AppRouter.kVerifyOtpPage),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  foregroundColor: Theme.of(context).colorScheme.onPrimary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(kBorderRadius),
                  ),
                  elevation: 0,
                ),
                child: Text(
                  AppString.sendOtp.tr(),
                  style: TextStyles.textStyle16.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            
            const SizedBox(height: Spacing.s32),
            
            // Back to Login
            Center(
              child: TextButton(
                onPressed: () => context.go(AppRouter.kLoginPage),
                child: Text(
                  AppString.backToLogin.tr(),
                  style: TextStyles.textStyle16.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
} 