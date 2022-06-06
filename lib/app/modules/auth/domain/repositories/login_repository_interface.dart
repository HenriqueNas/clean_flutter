import 'package:clean_dart/app/modules/auth/domain/entities/logged_user_data.dart';
import 'package:clean_dart/app/modules/auth/domain/entities/login_credential.dart';
import 'package:clean_dart/app/modules/auth/domain/errors/login_errors.dart';
import 'package:clean_dart/app/modules/auth/domain/errors/logout_errors.dart';
import 'package:dartz/dartz.dart';

abstract class LoginRepositoryInterface {
  Future<Either<LoginFailure, LoggedUserData>> loginPhone(
    LoginCredential credential,
  );

  Future<Either<LogoutFailure, Unit>> logout();
}
