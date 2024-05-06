import 'package:onedigital_customer/_all.dart';

class ChangeAccountPasswordRequestModel {
  final String? password;
  final String? newPassword;

  ChangeAccountPasswordRequestModel({
    this.password,
    this.newPassword,
  });

  factory ChangeAccountPasswordRequestModel.fromMap(Map<String, dynamic> map) {
    return ChangeAccountPasswordRequestModel(
      password: map.parseValue('password'),
      newPassword: map.parseValue('newPassword'),
    );
  }
}
