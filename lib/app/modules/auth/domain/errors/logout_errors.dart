abstract class LogoutFailure implements Exception {
  String get message;
}

class LogoutUserFailure extends LogoutFailure {
  @override
  final String message;

  LogoutUserFailure(this.message);
}
