class LoginCredential {
  final String phone;
  final String password;

  LoginCredential({
    required this.phone,
    required this.password,
  });

  bool get isValidPassword => password.isNotEmpty && password.length >= 4;

  bool get isValidPhone => phone.isNotEmpty && phone.length == 11;
}
