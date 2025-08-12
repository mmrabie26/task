import 'dart:io';
import 'package:dio/dio.dart';
import 'package:task/core/error/failure.dart';

class ServerException implements Exception {
  final Failure failure;
  ServerException(this.failure);
}

