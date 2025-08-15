import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/core/constants/app_strings.dart';
import 'package:task/core/constants/spacing.dart';
import 'package:task/feature/home/data/models/user_model.dart';
import 'package:task/feature/home/domain/entities/user_entity.dart';
import 'package:task/feature/home/presentaion/cubit/home_cubit.dart';
import 'package:task/feature/home/presentaion/cubit/home_state.dart';

class UsersListBody extends StatelessWidget {
  List<UserEntity> users=[];
   UsersListBody({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit,HomeState>(
      listener: (context, state) {

      },
      builder: (context, state) {
        users=state.users;
        return SafeArea(
          child: Column(
            children: [
              const SizedBox(height: Spacing.s4),
              Expanded(child: _buildUsersList(context)),
            ],
          ),
        );
      },

    );
  }

  Widget _buildUsersList(BuildContext context) {
    if (users.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.people_outline,
              size: 64,
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5),
            ),
            const SizedBox(height: Spacing.s16),
            Text(
              AppString.noUsersFound,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
              ),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: Spacing.s16),
      itemCount: users.length,
      itemBuilder: (context, index) {
        final user = users[index];
        return _buildUserCard(context, user);
      },
    );
  }

  Widget _buildUserCard(BuildContext context, UserEntity user) {
    return Card(
      margin: const EdgeInsets.only(bottom: Spacing.s12),
      child: ListTile(
        contentPadding: const EdgeInsets.all(Spacing.s16),
        leading: Stack(
          children: [
            CircleAvatar(
              radius: 25,
              backgroundColor: Theme.of(context).colorScheme.primary,
              child: Text(
                user.name.isNotEmpty ? user.name[0].toUpperCase() : 'U',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
        title: Text(
          user.name,
          style: Theme.of(
            context,
          ).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: Spacing.s4),
            Text(
              user.email,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
              ),
            ),
            const SizedBox(height: Spacing.s4),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: Spacing.s8,
                    vertical: Spacing.s4,
                  ),
                  decoration: BoxDecoration(
                    color: _getUserTypeColor(user.gender).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    user.gender,
                    style: TextStyle(
                      color: _getUserTypeColor(user.gender),
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(width: Spacing.s8),
                Text(
                  user.phone,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(
                      context,
                    ).colorScheme.onSurface.withOpacity(0.5),
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Color _getUserTypeColor(String gender) {
    switch (gender.toLowerCase()) {
      case 'male':
        return Colors.blue;
      case 'female':
        return Colors.pink;
      default:
        return Colors.grey;
    }
  }
}
