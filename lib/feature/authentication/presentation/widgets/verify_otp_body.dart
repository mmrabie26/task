import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:task/app/router/app_router.dart';
import 'package:task/core/constants/app_strings.dart';
import 'package:task/core/constants/enums.dart';
import 'package:task/core/constants/spacing.dart';
import 'package:task/core/constants/text_styles.dart';
import 'package:task/feature/authentication/presentation/cubit/otp/otp_cubit.dart';
import 'package:task/feature/authentication/presentation/cubit/otp/otp_state.dart';

class VerifyOtpBody extends StatelessWidget {
  const VerifyOtpBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OtpCubit,OtpState>(
      listener: (context, state) {
        if(state.status==VerifyEmailState.verify){
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('verify email successfully!')),
          );
          context.go(AppRouter.kVerifyOtpPage);
        }
        if(state.status==VerifyEmailState.notVerify){
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('verify email unsuccessfully!')),
          );
        }
        if(state.status==VerifyEmailState.error){
          ScaffoldMessenger.of(context).showSnackBar(
             SnackBar(content: Text(state.errorMessage)),
          );
        }
      },
      builder: (context, state) {
        final cubit=context.read<OtpCubit>();
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
                         Icons.verified_user,
                         size: 40,
                         color: Theme.of(context).colorScheme.primary,
                       ),
                     ),
                     const SizedBox(height: Spacing.s24),
                     Text(
                       AppString.verifyOtp.tr(),
                       style: TextStyles.textStyle24.copyWith(
                         fontWeight: FontWeight.bold,
                         color: Theme.of(context).colorScheme.onSurface,
                       ),
                       textAlign: TextAlign.center,
                     ),
                     const SizedBox(height: Spacing.s16),
                     Text(
                       AppString.checkEmail.tr(),
                       style: TextStyles.textStyle16.copyWith(
                         color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
                       ),
                       textAlign: TextAlign.center,
                     ),
                   ],
                 ),
               ),

               const SizedBox(height: Spacing.s32),

               SizedBox(
                 width: double.infinity,
                 height: 56,
                 child: ElevatedButton(
                   onPressed: () => cubit.checkEmailVerify(),
                   style: ElevatedButton.styleFrom(
                     backgroundColor: Theme.of(context).colorScheme.primary,
                     foregroundColor: Theme.of(context).colorScheme.onPrimary,
                     shape: RoundedRectangleBorder(
                       borderRadius: BorderRadius.circular(kBorderRadius),
                     ),
                     elevation: 0,
                   ),
                   child: Text(
                     AppString.verify.tr(),
                     style: TextStyles.textStyle16.copyWith(
                       fontWeight: FontWeight.w600,
                     ),
                   ),
                 ),
               ),

               const SizedBox(height: Spacing.s32),

               Center(
                 child: TextButton(
                   onPressed:state.resendCounter!=0?null: () {
                     cubit.resendEmailVerify();
                   },
                   child: Text(
                     state.resendCounter==0?AppString.resendCode.tr():'resend after ${state.resendCounter} seconds',
                     style: TextStyles.textStyle16.copyWith(
                       color:state.resendCounter==0? Theme.of(context).colorScheme.primary:Colors.grey,
                       fontWeight: FontWeight.w600,
                     ),
                   ),
                 ),
               ),

               const SizedBox(height: Spacing.s24),

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
      },

    );
  }
} 