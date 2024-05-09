import 'package:onedigital_customer/_all.dart';

class ValidateMultiFactorAuthenticationCodeRequestModel {
  final String? email;
  final String? token;
  final String? code;

  ValidateMultiFactorAuthenticationCodeRequestModel({
    this.email,
    this.token,
    this.code,
  });

  ValidateMultiFactorAuthenticationCodeRequestModel copyWith({
    String? email,
    String? token,
    String? code,
  }) {
    return ValidateMultiFactorAuthenticationCodeRequestModel(
      email: email ?? this.email,
      token: token ?? this.token,
      code: code ?? this.code,
    );
  }

  factory ValidateMultiFactorAuthenticationCodeRequestModel.fromJson(Map<String, dynamic> json) {
    return ValidateMultiFactorAuthenticationCodeRequestModel(
      email: json.parseValue('email'),
      token: json.parseValue('token'),
      code: json.parseValue('code'),
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'email': email,
      'token': token,
      'code': code,
    };
  }
}
