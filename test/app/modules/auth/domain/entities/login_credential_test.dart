import 'package:clean_dart/app/modules/auth/domain/entities/login_credential.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  group("should check if field is valid or not", () {
    test('empty phone or password must not be a valid credential', () {
      expect(LoginCredential(phone: '', password: '').isValidPhone, false);
      expect(LoginCredential(phone: '', password: '').isValidPassword, false);
    });

    test('password must have 4 at least characters', () {
      expect(
        LoginCredential(phone: '', password: '123').isValidPassword,
        false,
      );
      expect(
        LoginCredential(phone: '', password: '1234').isValidPassword,
        true,
      );
      expect(
        LoginCredential(phone: '', password: '12345678').isValidPassword,
        true,
      );
    });
  });
}
