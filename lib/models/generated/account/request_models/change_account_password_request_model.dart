import 'package:onedigital_customer/_all.dart';

class ChangeAccountPasswordRequestModel {
  final String? password;
  final String? newPassword;

  ChangeAccountPasswordRequestModel({
    this.password,
    this.newPassword,
  });

  ChangeAccountPasswordRequestModel copyWith({
    String? password,
    String? newPassword,
  }) {
    return ChangeAccountPasswordRequestModel(
      password: password ?? this.password,
      newPassword: newPassword ?? this.newPassword,
    );
  }

  factory ChangeAccountPasswordRequestModel.fromJson(Map<String, dynamic> json) {
    return ChangeAccountPasswordRequestModel(
      password: json.parseValue('password'),
      newPassword: json.parseValue('newPassword'),
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'password': password,
      'newPassword': newPassword,
    };
  }
}
