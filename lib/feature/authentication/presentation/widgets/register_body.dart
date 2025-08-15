import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:task/app/router/app_router.dart';
import 'package:task/core/constants/app_colors.dart';
import 'package:task/core/constants/app_strings.dart';
import 'package:task/core/constants/enums.dart';
import 'package:task/core/constants/spacing.dart';
import 'package:task/core/constants/text_styles.dart';
import 'package:task/core/services/select_image.dart';
import 'package:task/feature/authentication/presentation/cubit/register/register_cubit.dart';
import 'package:task/feature/authentication/presentation/cubit/register/register_state.dart';
import 'package:task/feature/authentication/presentation/widgets/auth_text_from_field.dart';

class RegisterBody extends StatelessWidget {
  const RegisterBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if(state.status==RequestState.loaded){
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('User registered successfully!')),
          );
          context.go(AppRouter.kVerifyOtpPage);
        }
        if(state.status==RequestState.error){
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('User registered unsuccessfully!')),
          );
        }
      },
      builder: (context, state) {
        final cubit = context.read<RegisterCubit>();
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
                        onTap: () => cubit.whenChangeImage(),
                        child: CircleAvatar(
                          radius: 50,
                          backgroundColor: Theme.of(context)
                              .colorScheme
                              .primary
                              .withOpacity(0.1),
                          backgroundImage:
                          state.image != null ? FileImage(state.image!) : null,
                          child: state.image == null
                              ? Icon(
                            Icons.person,
                            size: 50,
                            color: Theme.of(context).colorScheme.primary,
                          )
                              : null,
                        ),
                      ),
                      const SizedBox(height: Spacing.s12),
                      TextButton(
                        onPressed: () => cubit.whenChangeImage(),
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
                  errorText: !state.isValidName && state.name.isNotEmpty
                      ? "name is invalid"
                      : null,
                  icon: Icons.person_outlined,
                  keyboardType: TextInputType.name,
                  onChange: (String name) => cubit.whenNameChange(name),
                ),

                const SizedBox(height: Spacing.s24),

                authTextFromField(
                  label: AppString.email.tr(),
                  hint: 'example@email.com',
                  icon: Icons.email_outlined,
                  keyboardType: TextInputType.emailAddress,
                  errorText: !state.isValidEmail && state.email.isNotEmpty
                      ? "email is invalid"
                      : null,
                  onChange: (String email) => cubit.whenEmailChange(email),
                ),

                const SizedBox(height: Spacing.s24),

                authTextFromField(
                  label: AppString.phone.tr(),
                  hint: AppString.enterPhone.tr(),
                  icon: Icons.phone_outlined,
                  keyboardType: TextInputType.phone,
                  errorText: !state.isValidPhone && state.phone.isNotEmpty
                      ? "phone is invalid"
                      : null,
                  onChange: (String phone) => cubit.whenPhoneChange(phone),
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
                          state.gender == 'male'
                              ? AppString.male.tr()
                              : AppString.female.tr(),
                          style: TextStyles.textStyle16.copyWith(
                            color: Colors.grey[600],
                          ),
                        ),
                        items: [AppString.male.tr(), AppString.female.tr()].map(
                          (gender) {
                            return DropdownMenuItem(
                              value: gender,
                              child: Text(gender),
                            );
                          },
                        ).toList(),
                        onChanged: (gender) =>
                            cubit.whenGenderChange(gender ?? "male"),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: Spacing.s24),

                authTextFromField(
                  label: AppString.password.tr(),
                  hint: AppString.enterPassword.tr(),
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

                const SizedBox(height: Spacing.s24),

                authTextFromField(
                  label: AppString.confirmPassword.tr(),
                  hint: AppString.confirmPasswordHint.tr(),
                  icon: Icons.lock_outlined,
                  isPassword: state.showConfirmPassword,
                  suffixIcon: InkWell(
                    child: Icon(
                      state.showConfirmPassword
                          ? Icons.remove_red_eye_outlined
                          : Icons.remove_red_eye,
                      color: AppColors.primary,
                    ),
                    onTap: () => cubit.showConfirmPassword(),
                  ),
                  errorText:
                      !state.isValidConfirmPassword &&
                          state.confirmPassword.isNotEmpty
                      ? "confirm password is invalid"
                      : null,
                  onChange: (String password) =>
                      cubit.whenConfirmPasswordChange(password),
                ),

                const SizedBox(height: Spacing.s32),

                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    onPressed:
                        !state.isRegisterSubmitValid ||
                            state.status == RequestState.loading
                        ? null
                        : () => cubit.registerSubmit(),
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
                        color: Theme.of(
                          context,
                        ).colorScheme.onSurface.withOpacity(0.7),
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
      },
    );
  }
}
