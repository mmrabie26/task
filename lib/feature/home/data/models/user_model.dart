import 'dart:io';
import 'package:task/feature/home/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
   UserModel({
     super.id,
    required super.name,
    required super.email,
    required super.phone,
    required super.gender,
    super.image,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      gender: json['gender'] ?? '',
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'gender': gender,
      'image': image,
    };
  }

  factory UserModel.fromEntity(UserEntity entity) {
    return UserModel(
      id: entity.id,
      name: entity.name,
      email: entity.email,
      phone: entity.phone,
      gender: entity.gender,
      image: entity.image,
    );
  }

  UserEntity toEntity() {
    return UserEntity(
      id: id,
      name: name,
      email: email,
      phone: phone,
      gender: gender,
      image: image,
    );
  }
}
