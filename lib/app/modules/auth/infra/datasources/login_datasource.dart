import 'dart:async';

import 'package:clean_dart/app/modules/auth/domain/entities/login_credential.dart';

abstract class LoginDatasourceInterface {
  Future<dynamic> loginPhone(LoginCredential credential);

  Future<void> logout();
}
