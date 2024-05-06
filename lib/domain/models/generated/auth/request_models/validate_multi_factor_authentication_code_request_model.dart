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

  factory ValidateMultiFactorAuthenticationCodeRequestModel.fromMap(Map<String, dynamic> map) {
    return ValidateMultiFactorAuthenticationCodeRequestModel(
      email: map.parseValue('email'),
      token: map.parseValue('token'),
      code: map.parseValue('code'),
    );
  }
}
