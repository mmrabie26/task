import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:task/app/router/app_router.dart';
import 'package:task/core/constants/app_strings.dart';
import 'package:task/core/constants/spacing.dart';
import 'package:task/core/services/local_storage_service.dart';
import 'package:task/core/widgets/default_app_bar.dart';
import 'package:task/feature/home/presentaion/widgets/users_list_body.dart';
import 'package:task/feature/home/data/models/user_model.dart';

class UsersListPage extends StatelessWidget {
  const UsersListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: InkWell(
          onTap: () => context.push(AppRouter.kProfileSettingsPage),
          child: Row(
            children: [
              CircleAvatar(
                radius: 25,
                backgroundColor: Theme.of(context).colorScheme.primary,
                child: Text(
                  LocalStorageService().getUser()?.name[0].toUpperCase() ?? 'U',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
              const SizedBox(width: Spacing.s8,),
              Text(
                LocalStorageService().getUser()?.name??"user name",
              )
            ],
          ),
        ),
      ),
      body: UsersListBody(),
    );
  }
} 