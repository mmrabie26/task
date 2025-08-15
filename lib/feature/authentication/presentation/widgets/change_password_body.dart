import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:task/app/router/app_router.dart';
import 'package:task/core/constants/app_strings.dart';
import 'package:task/core/constants/spacing.dart';
import 'package:task/core/constants/text_styles.dart';
import 'package:task/feature/authentication/presentation/widgets/auth_text_from_field.dart';

class ChangePasswordBody extends StatelessWidget {
  const ChangePasswordBody({super.key});

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
                      Icons.lock_outline,
                      size: 40,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  const SizedBox(height: Spacing.s24),
                  Text(
                    AppString.changePasswordTitle.tr(),
                    style: TextStyles.textStyle24.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: Spacing.s16),
                  Text(
                    AppString.createNewPassword.tr(),
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
              label: AppString.newPassword.tr(),
              hint: AppString.enterNewPassword.tr(),
              icon: Icons.lock_outlined,
              isPassword: true, errorText: '', onChange: (String value) {  },
            ),
            
            const SizedBox(height: Spacing.s24),

            authTextFromField(
              label: AppString.confirmNewPassword.tr(),
              hint: AppString.confirmNewPasswordHint.tr(),
              icon: Icons.lock_outlined,
              isPassword: true, errorText: '', onChange: (String value) {  },
            ),
            
            const SizedBox(height: Spacing.s32),
            
            Container(
              padding: const EdgeInsets.all(Spacing.s16),
              decoration: BoxDecoration(
                color: Colors.grey[50],
                borderRadius: BorderRadius.circular(kBorderRadius),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppString.passwordRequirements.tr(),
                    style: TextStyles.textStyle14.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: Spacing.s8),
                  Text(
                    AppString.passwordRequirementsText.tr(),
                    style: TextStyles.textStyle14.copyWith(
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: Spacing.s32),
            
            // Change Password Button
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: () => context.go(AppRouter.kLoginPage),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  foregroundColor: Theme.of(context).colorScheme.onPrimary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(kBorderRadius),
                  ),
                  elevation: 0,
                ),
                child: Text(
                  AppString.confirm.tr(),
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

  Widget _buildTextField({
    required String label,
    required String hint,
    required IconData icon,
    bool isPassword = false,
    TextInputType? keyboardType,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyles.textStyle16.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: Spacing.s8),
        TextFormField(
          keyboardType: keyboardType,
          obscureText: isPassword,
          decoration: InputDecoration(
            hintText: hint,
            prefixIcon: Icon(
              icon,
              color: Colors.grey[600],
            ),
            filled: true,
            fillColor: Colors.grey[50],
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(kBorderRadius),
              borderSide: BorderSide.none,
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: Spacing.s16,
              vertical: Spacing.s16,
            ),
          ),
        ),
      ],
    );
  }
} 