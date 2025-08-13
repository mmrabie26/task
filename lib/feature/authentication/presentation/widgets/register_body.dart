import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:task/app/router/app_router.dart';
import 'package:task/core/constants/app_strings.dart';
import 'package:task/core/constants/spacing.dart';
import 'package:task/core/constants/text_styles.dart';
import 'package:task/feature/authentication/presentation/widgets/auth_text_from_field.dart';

class RegisterBody extends StatelessWidget {
  const RegisterBody({super.key});

  @override
  Widget build(BuildContext context) {
    context.setLocale(Locale('ar'));
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(Spacing.s24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Center(
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      // TODO: Implement image picker
                    },
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(
                          color: Theme.of(context).colorScheme.primary.withOpacity(0.3),
                          width: 2,
                        ),
                      ),
                      child: Icon(
                        Icons.person,
                        size: 50,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
                  const SizedBox(height: Spacing.s12),
                  TextButton(
                    onPressed: () {
                      // TODO: Implement image picker
                    },
                    child: Text(
                      AppString.profilePicture.tr(),
                      style: TextStyles.textStyle14.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: Spacing.s32),
            
            authTextFromField(
              label: AppString.fullName.tr(),
              hint: AppString.enterFullName.tr(),
              icon: Icons.person_outlined,
              keyboardType: TextInputType.name,
            ),
            
            const SizedBox(height: Spacing.s24),

            authTextFromField(
              label: AppString.email.tr(),
              hint: 'example@email.com',
              icon: Icons.email_outlined,
              keyboardType: TextInputType.emailAddress,
            ),
            
            const SizedBox(height: Spacing.s24),

            authTextFromField(
              label: AppString.phone.tr(),
              hint: AppString.enterPhone.tr(),
              icon: Icons.phone_outlined,
              keyboardType: TextInputType.phone,
            ),
            
            const SizedBox(height: Spacing.s24),
            
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppString.gender.tr(),
                  style: TextStyles.textStyle16.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: Spacing.s8),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[50],
                    borderRadius: BorderRadius.circular(kBorderRadius),
                  ),
                  child: DropdownButtonFormField<String>(
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: Spacing.s16,
                        vertical: Spacing.s16,
                      ),
                    ),
                    hint: Text(
                      AppString.selectGender.tr(),
                      style: TextStyles.textStyle16.copyWith(
                        color: Colors.grey[600],
                      ),
                    ),
                    items: [
                      AppString.male.tr(),
                      AppString.female.tr(),
                    ].map((gender) {
                      return DropdownMenuItem(
                        value: gender,
                        child: Text(gender),
                      );
                    }).toList(),
                    onChanged: (value) {
                      // TODO: Handle gender selection
                    },
                  ),
                ),
              ],
            ),
            
            const SizedBox(height: Spacing.s24),

            authTextFromField(
              label: AppString.password.tr(),
              hint: AppString.enterPassword.tr(),
              icon: Icons.lock_outlined,
              isPassword: true,
            ),
            
            const SizedBox(height: Spacing.s24),

            authTextFromField(
              label: AppString.confirmPassword.tr(),
              hint: AppString.confirmPasswordHint.tr(),
              icon: Icons.lock_outlined,
              isPassword: true,
            ),
            
            const SizedBox(height: Spacing.s32),
            
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: () => context.go(AppRouter.kHomePage),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  foregroundColor: Theme.of(context).colorScheme.onPrimary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(kBorderRadius),
                  ),
                  elevation: 0,
                ),
                child: Text(
                  AppString.signUp.tr(),
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
                  AppString.haveAccount.tr(),
                  style: TextStyles.textStyle16.copyWith(
                    color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
                  ),
                ),
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(
                    AppString.login.tr(),
                    style: TextStyles.textStyle16.copyWith(
                      color: Theme.of(context).colorScheme.primary,
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