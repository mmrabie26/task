import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:task/app/router/app_router.dart';
import 'package:task/core/constants/app_colors.dart';
import 'package:task/core/constants/enums.dart';
import 'package:task/core/constants/spacing.dart';
import 'package:task/core/constants/text_styles.dart';
import 'package:task/core/constants/app_strings.dart';
import 'package:task/feature/authentication/presentation/cubit/login/login_cubit.dart';
import 'package:task/feature/authentication/presentation/cubit/login/login_state.dart';
import 'package:task/feature/authentication/presentation/widgets/auth_text_from_field.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if(state.status==RequestState.loaded){
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('User login successfully!')),
          );
          context.go(AppRouter.kUsersListPage);
        }
        if(state.status==RequestState.error){
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('User login unsuccessfully!')),
          );
        }
      },
      builder: (context, state) {
        final cubit = context.read<LoginCubit>();
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
                          color: Theme.of(
                            context,
                          ).colorScheme.primary.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: Icon(
                          Icons.school,
                          size: 40,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      const SizedBox(height: Spacing.s24),
                      Text(
                        AppString.welcomeBack.tr(),
                        style: TextStyles.textStyle24.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.onSurface,
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
                  errorText: !state.isValidEmail && state.email.isNotEmpty
                      ? 'email is invalid'
                      : null,
                  onChange: (String email) => cubit.whenEmailChange(email),
                ),

                const SizedBox(height: Spacing.s24),

                authTextFromField(
                  label: AppString.password.tr(),
                  hint: 'Enter your password',
                  icon: Icons.lock_outlined,
                  isPassword: state.showPassword,
                  suffixIcon: InkWell(
                    child: Icon(
                      state.showPassword
                          ? Icons.remove_red_eye_outlined
                          : Icons.remove_red_eye,
                      color: AppColors.primary,
                    ),
                    onTap: () => cubit.showPassword(),
                  ),
                  errorText: !state.isValidPassword && state.password.isNotEmpty
                      ? "password is invalid"
                      : null,
                  onChange: (String password) =>
                      cubit.whenPasswordChange(password),
                ),

                const SizedBox(height: Spacing.s16),

                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () => context.push(AppRouter.kForgetPasswordPage),
                    child: Text(
                      AppString.forgotPassword.tr(),
                      style: TextStyles.textStyle14.copyWith(
                        color: Theme.of(context).colorScheme.primary,
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
                    onPressed:
                        !(state.isValidPassword && state.isValidEmail) ||
                            state.status == RequestState.loading
                        ? null
                        : () => cubit.loginSubmit(),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      foregroundColor: Theme.of(context).colorScheme.onPrimary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(kBorderRadius),
                      ),
                      elevation: 0,
                    ),
                    child: state.status == RequestState.loading
                        ? SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                Theme.of(context).colorScheme.onPrimary,
                              ),
                            ),
                          )
                        : Text(
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
                        color: Theme.of(
                          context,
                        ).colorScheme.onSurface.withOpacity(0.7),
                      ),
                    ),
                    TextButton(
                      onPressed: () => context.push(AppRouter.kRegisterPage),
                      child: Text(
                        AppString.signUp.tr(),
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
      },
    );
  }
}
