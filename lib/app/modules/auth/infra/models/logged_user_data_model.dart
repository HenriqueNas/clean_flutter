import 'package:clean_dart/app/modules/auth/domain/entities/logged_user_data.dart';

class LoggedUserDataModel extends LoggedUserData {
  LoggedUserDataModel({
    required String? token,
    required String? name,
    required String? phone,
  }) : super(
          token: token,
          name: name,
          phone: phone,
        );

  factory LoggedUserDataModel.fromJson(Map<String, String> json) =>
      LoggedUserDataModel(
        name: json['name'],
        phone: json['phone'],
        token: json['name'],
      );
}
