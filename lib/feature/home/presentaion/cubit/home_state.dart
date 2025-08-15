import 'package:equatable/equatable.dart';
import 'package:task/core/constants/enums.dart';
import 'package:task/feature/home/domain/entities/user_entity.dart';

class HomeState extends Equatable{
  final RequestState status;
  final UserEntity user;
  final List<UserEntity> users;

  const HomeState({
    required this.user,
    required this.users,
    this.status=RequestState.initial
});

  HomeState copyWith({
    RequestState? status,
    UserEntity? user,
    List<UserEntity>? users,
  })=>
    HomeState(
      status: status ?? this.status,
      user: user ?? this.user,
      users: users ?? this.users,
    );

  @override
  List<Object?> get props =>[user,users,status];
}