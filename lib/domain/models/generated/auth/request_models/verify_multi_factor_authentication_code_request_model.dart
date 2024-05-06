import 'package:onedigital_customer/_all.dart';

class VerifyMultiFactorAuthenticationCodeRequestModel {
  final String? email;
  final String? token;
  final String? code;

  VerifyMultiFactorAuthenticationCodeRequestModel({
    this.email,
    this.token,
    this.code,
  });

  factory VerifyMultiFactorAuthenticationCodeRequestModel.fromMap(Map<String, dynamic> map) {
    return VerifyMultiFactorAuthenticationCodeRequestModel(
      email: map.parseValue('email'),
      token: map.parseValue('token'),
      code: map.parseValue('code'),
    );
  }
}
