import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:task/app/router/app_router.dart';
import 'package:task/core/constants/spacing.dart';
import 'package:task/core/constants/text_styles.dart';
import 'package:task/core/constants/app_strings.dart';
import 'package:task/feature/authentication/presentation/widgets/auth_text_from_field.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(Spacing.s24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: Spacing.s32),

            Center(
              child: Column(
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: Theme
                          .of(context)
                          .colorScheme
                          .primary
                          .withOpacity(0.1),
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: Icon(
                      Icons.school,
                      size: 40,
                      color: Theme
                          .of(context)
                          .colorScheme
                          .primary,
                    ),
                  ),
                  const SizedBox(height: Spacing.s24),
                  Text(
                    AppString.welcomeBack.tr(),
                    style: TextStyles.textStyle24.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Theme
                          .of(context)
                          .colorScheme
                          .onSurface,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: Spacing.s8),
                  Text(
                    AppString.loginSubtitle.tr(),
                    style: TextStyles.textStyle16.copyWith(
                      color: Theme
                          .of(context)
                          .colorScheme
                          .onSurface
                          .withOpacity(0.7),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),

            const SizedBox(height: Spacing.s48),

            authTextFromField(
              label: AppString.email.tr(),
              hint: 'example@email.com',
              icon: Icons.email_outlined,
              keyboardType: TextInputType.emailAddress,
            ),

            const SizedBox(height: Spacing.s24),

            authTextFromField(
              label: AppString.password.tr(),
              hint: 'Enter your password',
              icon: Icons.lock_outlined,
              isPassword: true,
            ),

            const SizedBox(height: Spacing.s16),

            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () => context.go(AppRouter.kForgetPasswordPage),
                child: Text(
                  AppString.forgotPassword.tr(),
                  style: TextStyles.textStyle14.copyWith(
                    color: Theme
                        .of(context)
                        .colorScheme
                        .primary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),

            const SizedBox(height: Spacing.s32),

            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: () => context.go(AppRouter.kHomePage),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme
                      .of(context)
                      .colorScheme
                      .primary,
                  foregroundColor: Theme
                      .of(context)
                      .colorScheme
                      .onPrimary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(kBorderRadius),
                  ),
                  elevation: 0,
                ),
                child: Text(
                  AppString.login.tr(),
                  style: TextStyles.textStyle16.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),

            const SizedBox(height: Spacing.s32),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  AppString.noAccount.tr(),
                  style: TextStyles.textStyle16.copyWith(
                    color: Theme
                        .of(context)
                        .colorScheme
                        .onSurface
                        .withOpacity(0.7),
                  ),
                ),
                TextButton(
                  onPressed: () => context.push(AppRouter.kRegisterPage),
                  child: Text(
                    AppString.                                      signUp.tr(),
                    style: TextStyles.textStyle16.copyWith(
                      color: Theme
                          .of(context)
                          .colorScheme
                          .primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}