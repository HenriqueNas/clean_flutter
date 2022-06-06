import 'package:clean_dart/app/modules/auth/domain/errors/logout_errors.dart';
import 'package:clean_dart/app/modules/auth/domain/repositories/login_repository_interface.dart';
import 'package:dartz/dartz.dart';

abstract class LogoutInterface {
  Future<Either<LogoutFailure, Unit>> call();
}

class Logout implements LogoutInterface {
  final LoginRepositoryInterface repository;

  Logout(this.repository);

  @override
  Future<Either<LogoutFailure, Unit>> call() async {
    return await repository.logout();
  }
}
