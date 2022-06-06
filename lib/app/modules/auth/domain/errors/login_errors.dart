abstract class LoginFailure implements Exception {
  String get message;
}

class LoginWithPhoneFailure extends LoginFailure {
  @override
  final String message;

  LoginWithPhoneFailure(this.message);
}
