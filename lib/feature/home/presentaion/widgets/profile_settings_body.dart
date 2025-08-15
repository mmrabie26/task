import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:task/core/constants/app_strings.dart';
import 'package:task/core/constants/spacing.dart';
import 'package:task/core/services/LanguageProvider.dart';
import 'package:task/core/theme/theme_helper.dart';
import 'package:task/feature/home/data/models/user_model.dart';
import 'package:task/feature/home/domain/entities/user_entity.dart';
import 'package:task/feature/home/presentaion/cubit/home_cubit.dart';
import 'package:task/feature/home/presentaion/cubit/home_state.dart';

class ProfileSettingsBody extends StatelessWidget {
  const ProfileSettingsBody({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit,HomeState>(
      listener: (context, state) {

      },
      builder: (context, state) {
       return SafeArea(
         child: SingleChildScrollView(
           padding: const EdgeInsets.all(Spacing.s16),
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               // Profile Header Section
               _buildProfileHeader(context,state.user),
               const SizedBox(height: Spacing.s24),
         
               // Personal Information Section
               _buildSectionTitle(context, AppString.personalInfo.tr()),
               const SizedBox(height: Spacing.s16),
               _buildPersonalInfoCard(context,state.user),
               const SizedBox(height: Spacing.s24),
         
               // Account Settings Section
               _buildSectionTitle(context, AppString.accountSettings.tr()),
               const SizedBox(height: Spacing.s16),
               _buildAccountSettingsCard(context),
               const SizedBox(height: Spacing.s24),
         
               // Logout Button
               Container(
                 width: double.infinity,
                 height: 56,
                 decoration: BoxDecoration(
                   gradient: LinearGradient(
                     colors: [
                       Theme.of(context).colorScheme.error,
                       Theme.of(context).colorScheme.error.withOpacity(0.8),
                     ],
                   ),
                   borderRadius: BorderRadius.circular(16),
                   boxShadow: [
                     BoxShadow(
                       color: Theme.of(context).colorScheme.error.withOpacity(0.3),
                       blurRadius: 10,
                       offset: const Offset(0, 5),
                     ),
                   ],
                 ),
                 child: ElevatedButton.icon(
                   onPressed: () {},
                   icon: const Icon(Icons.logout, color: Colors.white),
                   label: Text(
                     AppString.logout.tr(),
                     style: const TextStyle(
                       color: Colors.white,
                       fontSize: 16,
                       fontWeight: FontWeight.w600,
                     ),
                   ),
                   style: ElevatedButton.styleFrom(
                     backgroundColor: Colors.transparent,
                     shadowColor: Colors.transparent,
                     shape: RoundedRectangleBorder(
                       borderRadius: BorderRadius.circular(16),
                     ),
                   ),
                 ),
               ),
               const SizedBox(height: Spacing.s32),
             ],
           ),
         ),
       );
      },

    );
  }

  Widget _buildProfileHeader(BuildContext context,UserEntity user) {
    return Container(
      padding: const EdgeInsets.all(Spacing.s24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Theme.of(context).colorScheme.primary,
            Theme.of(context).colorScheme.primary.withOpacity(0.8),
          ],
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Center(
        child: Column(
          children: [
            // Profile Picture
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 4),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: CircleAvatar(
                radius: 45,
                backgroundColor: Colors.white,
                child: Text(
                  user.name.isNotEmpty
                      ? user.name[0].toUpperCase()
                      : 'U',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                  ),
                ),
              ),
            ),
            const SizedBox(height: Spacing.s16),

            // User Name
            Text(
              user.name,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: Spacing.s8),

            // User Email
            Text(
              user.email,
              style: TextStyle(
                color: Colors.white.withOpacity(0.9),
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.only(left: Spacing.s8, bottom: Spacing.s8),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
          fontWeight: FontWeight.w600,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
    );
  }

  Widget _buildPersonalInfoCard(BuildContext context,UserEntity user) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          _buildInfoRow(
            context,
            AppString.fullName.tr().tr(),
            user.name,
            Icons.person,
          ),
          Divider(
            height: 1,
            thickness: 1,
            color: Colors.grey.withOpacity(0.2),
            indent: Spacing.s48,
            endIndent: Spacing.s16,
          ),
          _buildInfoRow(
            context,
            AppString.email.tr(),
            user.email,
            Icons.email,
          ),
          Divider(
            height: 1,
            thickness: 1,
            color: Colors.grey.withOpacity(0.2),
            indent: Spacing.s48,
            endIndent: Spacing.s16,
          ),
          _buildInfoRow(
            context,
            AppString.phone.tr(),
            user.phone,
            Icons.phone,
          ),
          Divider(
            height: 1,
            thickness: 1,
            color: Colors.grey.withOpacity(0.2),
            indent: Spacing.s48,
            endIndent: Spacing.s16,
          ),
          _buildInfoRow(
            context,
            AppString.gender.tr(),
            user.gender,
            Icons.wc,
          ),
        ],
      ),
    );
  }

  Widget _buildAccountSettingsCard(BuildContext context,) {
    final themeHelper = Provider.of<ThemeHelper>(context);
    final languageProvider = Provider.of<LanguageProvider>(context);

    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          _buildToggleTile(
            context,
            AppString.changeLanguage.tr(),
            languageProvider.isArabic
                ? AppString.languageArabic.tr()
                : AppString.languageEnglish.tr(),
            Icons.language,
            Switch(
              value: languageProvider.isArabic,
              onChanged: (value) => languageProvider.changeLanguage(value ? 'ar' : 'en'),
              activeColor: Theme.of(context).colorScheme.primary,
            ),
          ),
          Divider(
            height: 1,
            thickness: 1,
            color: Colors.grey.withOpacity(0.2),
            indent: 48,
            endIndent: 16,
          ),
          _buildToggleTile(
            context,
            AppString.changeTheme.tr(),
            themeHelper.isDarkMode ? AppString.darkTheme.tr() : AppString.lightTheme.tr(),
            Icons.palette,
            Switch(
              value: themeHelper.isDarkMode,
              onChanged: (value) => themeHelper.toggleTheme(),
              activeColor: Theme.of(context).colorScheme.primary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(
    BuildContext context,
    String label,
    String value,
    IconData icon,
  ) {
    return Padding(
      padding: const EdgeInsets.all(Spacing.s16),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(Spacing.s8),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              icon,
              color: Theme.of(context).colorScheme.primary,
              size: 20,
            ),
          ),
          const SizedBox(width: Spacing.s16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(
                      context,
                    ).colorScheme.onSurface.withOpacity(0.7),
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: Spacing.s4),
                Text(
                  value,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildToggleTile(
    BuildContext context,
    String title,
    String subtitle,
    IconData icon,
    Widget toggle,
  ) {
    return Padding(
      padding: const EdgeInsets.all(Spacing.s16),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(Spacing.s8),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              icon,
              color: Theme.of(context).colorScheme.primary,
              size: 20,
            ),
          ),
          const SizedBox(width: Spacing.s16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: Spacing.s4),
                Text(
                  subtitle,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(
                      context,
                    ).colorScheme.onSurface.withOpacity(0.7),
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          toggle,
        ],
      ),
    );
  }
}
