import 'dart:math';

import 'package:task/feature/authentication/data/datasource/remote_data_source.dart';
import 'package:task/feature/authentication/domain/repositories/auth_repo.dart';

class AuthRepoImplementation extends AuthRepo {
  final AuthRemoteDataSource _authRemoteDataSource;

  AuthRepoImplementation(this._authRemoteDataSource);
}
