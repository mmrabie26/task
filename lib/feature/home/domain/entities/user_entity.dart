import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'user_entity.g.dart';

@HiveType(typeId: 1)
class UserEntity extends Equatable {
  @HiveField(0)
  String? id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String email;

  @HiveField(3)
  final String phone;

  @HiveField(4)
  final String gender;

  @HiveField(5)
  String? image;

  UserEntity({
    this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.gender,
    this.image,
  });

  @override
  List<Object?> get props => [
    id,
    name,
    email,
    phone,
    gender,
    image,
  ];
}
