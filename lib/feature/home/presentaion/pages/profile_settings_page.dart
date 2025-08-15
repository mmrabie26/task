import 'package:flutter/material.dart';
import 'package:task/core/constants/app_strings.dart';
import 'package:task/core/widgets/default_app_bar.dart';
import 'package:task/feature/home/presentaion/widgets/profile_settings_body.dart';
import 'package:task/feature/home/data/models/user_model.dart';

class ProfileSettingsPage extends StatelessWidget {
  const ProfileSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ProfileSettingsBody(),
    );
  }
} 