import 'dart:collection';

import 'package:clean_dart/app/core/shared/external/datasources/api.dart';
import 'package:clean_dart/app/modules/auth/domain/entities/login_credential.dart';
import 'package:clean_dart/app/modules/auth/infra/datasources/login_datasource.dart';
import 'package:dio/dio.dart';

class LoginDatasource extends Api implements LoginDatasourceInterface {
  LoginDatasource({
    required String baseUrl,
    required Dio httpClient,
  }) : super(
          baseUrl: baseUrl,
          httpClient: httpClient,
        );

  @override
  Future<Map<String, String>> loginPhone(LoginCredential credential) async {
    final result = await get('/login');
    if (result.statusCode == 200) {
      final Map<String, String> dataMap = Map.from(result.data);

      return dataMap;
    } else {
      throw Exception();
    }
  }

  @override
  Future<void> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }
}
