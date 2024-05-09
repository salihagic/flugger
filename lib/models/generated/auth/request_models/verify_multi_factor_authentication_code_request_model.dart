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

  VerifyMultiFactorAuthenticationCodeRequestModel copyWith({
    String? email,
    String? token,
    String? code,
  }) {
    return VerifyMultiFactorAuthenticationCodeRequestModel(
      email: email ?? this.email,
      token: token ?? this.token,
      code: code ?? this.code,
    );
  }

  factory VerifyMultiFactorAuthenticationCodeRequestModel.fromJson(Map<String, dynamic> json) {
    return VerifyMultiFactorAuthenticationCodeRequestModel(
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
