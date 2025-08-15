import 'package:equatable/equatable.dart';
import 'package:task/core/constants/enums.dart';
import 'package:task/feature/home/domain/entities/user_entity.dart';

class HomeState extends Equatable{
  final RequestState status;
  final RequestState signOutStatus;
  final UserEntity user;
  final List<UserEntity> users;

  const HomeState({
    required this.user,
    required this.users,
    this.status=RequestState.initial,
    this.signOutStatus=RequestState.initial
});

  HomeState copyWith({
    RequestState? status,
    RequestState? signOutStatus,
    UserEntity? user,
    List<UserEntity>? users,
  })=>
    HomeState(
      status: status ?? this.status,
      user: user ?? this.user,
      users: users ?? this.users,
      signOutStatus: signOutStatus ?? this.signOutStatus
    );

  @override
  List<Object?> get props =>[user,users,status,signOutStatus];
}