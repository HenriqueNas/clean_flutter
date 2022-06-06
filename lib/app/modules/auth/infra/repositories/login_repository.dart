import 'package:clean_dart/app/modules/auth/domain/entities/logged_user_data.dart';
import 'package:clean_dart/app/modules/auth/domain/entities/login_credential.dart';
import 'package:clean_dart/app/modules/auth/domain/errors/login_errors.dart';
import 'package:clean_dart/app/modules/auth/domain/errors/logout_errors.dart';
import 'package:clean_dart/app/modules/auth/domain/repositories/login_repository_interface.dart';
import 'package:clean_dart/app/modules/auth/infra/datasources/login_datasource.dart';
import 'package:clean_dart/app/modules/auth/infra/models/logged_user_data_model.dart';
import 'package:dartz/dartz.dart';

class LoginRepository implements LoginRepositoryInterface {
  final LoginDatasourceInterface dataSource;

  LoginRepository(this.dataSource);

  @override
  Future<Either<LoginFailure, LoggedUserData>> loginPhone(
    LoginCredential credential,
  ) async {
    try {
      final userJson = await dataSource.loginPhone(credential);
      final user = LoggedUserDataModel.fromJson(userJson);
      return Right(user);
    } catch (e) {
      return Left(LoginWithPhoneFailure("Error login with Phone"));
    }
  }

  @override
  Future<Either<LogoutFailure, Unit>> logout() async {
    try {
      await dataSource.logout();
      return const Right(unit);
    } catch (e) {
      return Left(LogoutUserFailure("Error ao tentar fazer logout"));
    }
  }
}
