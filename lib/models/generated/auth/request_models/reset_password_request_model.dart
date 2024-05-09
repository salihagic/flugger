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

  ResetPasswordRequestModel copyWith({
    String? token,
    String? newPassword,
    String? email,
  }) {
    return ResetPasswordRequestModel(
      token: token ?? this.token,
      newPassword: newPassword ?? this.newPassword,
      email: email ?? this.email,
    );
  }

  factory ResetPasswordRequestModel.fromJson(Map<String, dynamic> json) {
    return ResetPasswordRequestModel(
      token: json.parseValue('token'),
      newPassword: json.parseValue('newPassword'),
      email: json.parseValue('email'),
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'token': token,
      'newPassword': newPassword,
      'email': email,
    };
  }
}
