import 'package:clean_dart/app/modules/auth/domain/entities/logged_user_data.dart';
import 'package:clean_dart/app/modules/auth/domain/entities/login_credential.dart';
import 'package:clean_dart/app/modules/auth/domain/repositories/login_repository_interface.dart';
import 'package:clean_dart/app/modules/auth/domain/usecases/login_with_phone.dart';
import 'package:clean_dart/app/modules/auth/external/datasources/login_datasource.dart';
import 'package:clean_dart/app/modules/auth/infra/datasources/login_datasource.dart';
import 'package:clean_dart/app/modules/auth/infra/repositories/login_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

void main() {
  final dio = Dio();
  final dioAdapter = DioAdapter(dio: dio);

  final LoginDatasourceInterface datasource = LoginDatasource(
    baseUrl: 'baseUrl',
    httpClient: dio,
  );
  final LoginRepositoryInterface repository = LoginRepository(datasource);
  final LoginWithPhoneInterface loginWithPhone = LoginWithPhone(repository);

  test(
    'should return valid LoggedUserData when try login with valid phone number and password',
    () async {
      const Map<String, String> jsonData = {
        'token': 'asdf121234asf',
        'phone': '47991909909',
        'name': 'Henrique',
      };

      dioAdapter.onGet(
        '/login',
        (server) => server.reply(200, jsonData),
      );

      final credential = LoginCredential(
        phone: '47991909909',
        password: '1234',
      );

      final loggedUser = await loginWithPhone(credential);

      expect(loggedUser.fold(id, id), isA<LoggedUserData>());
    },
  );
}
