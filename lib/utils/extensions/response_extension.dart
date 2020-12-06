import 'package:dio/dio.dart';

extension ResponseExtension on Response {
  bool get isSuccess => this.statusCode >= 200 && this.statusCode < 300;
}