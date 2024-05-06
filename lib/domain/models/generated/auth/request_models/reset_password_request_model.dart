import 'package:onedigital_customer/_all.dart';

class ResetPasswordRequestModel {
  final String? token;
  final String? newPassword;
  final String? email;

  ResetPasswordRequestModel({
    this.token,
    this.newPassword,
    this.email,
  });

  factory ResetPasswordRequestModel.fromMap(Map<String, dynamic> map) {
    return ResetPasswordRequestModel(
      token: map.parseValue('token'),
      newPassword: map.parseValue('newPassword'),
      email: map.parseValue('email'),
    );
  }
}
