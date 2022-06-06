import 'package:clean_dart/app/modules/auth/domain/entities/logged_user_data.dart';
import 'package:clean_dart/app/modules/auth/domain/entities/login_credential.dart';
import 'package:clean_dart/app/modules/auth/domain/errors/login_errors.dart';
import 'package:clean_dart/app/modules/auth/domain/repositories/login_repository_interface.dart';
import 'package:dartz/dartz.dart';

abstract class LoginWithPhoneInterface {
  Future<Either<LoginFailure, LoggedUserData>> call(LoginCredential credencial);
}

class LoginWithPhone implements LoginWithPhoneInterface {
  final LoginRepositoryInterface repository;

  LoginWithPhone(this.repository);

  @override
  Future<Either<LoginFailure, LoggedUserData>> call(
    LoginCredential credencial,
  ) async {
    if (!credencial.isValidPhone) {
      return Left(LoginWithPhoneFailure("Invalid phone number"));
    } else if (!credencial.isValidPassword) {
      return Left(LoginWithPhoneFailure("Invalid password"));
    }

    return await repository.loginPhone(credencial);
  }
}
