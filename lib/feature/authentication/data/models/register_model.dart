import 'package:task/feature/authentication/domain/entities/register_entity.dart';

class RegisterModel extends RegisterEntity {
  const RegisterModel({
    required super.name,
    required super.email,
    required super.phone,
    required super.password,
  });

  /// إنشاء Model من JSON
  factory RegisterModel.fromJson(Map<String, dynamic> json) {
    return RegisterModel(
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      password: json['password'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'password': password,
    };
  }

  factory RegisterModel.fromEntity(RegisterEntity entity) {
    return RegisterModel(
      name: entity.name,
      email: entity.email,
      phone: entity.phone,
      password: entity.password,
    );
  }
}
