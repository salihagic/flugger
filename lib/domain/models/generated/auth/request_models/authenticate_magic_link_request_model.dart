import 'package:onedigital_customer/_all.dart';

class AuthenticateMagicLinkRequestModel {
  final String? email;
  final String? token;

  AuthenticateMagicLinkRequestModel({
    this.email,
    this.token,
  });

  factory AuthenticateMagicLinkRequestModel.fromMap(Map<String, dynamic> map) {
    return AuthenticateMagicLinkRequestModel(
      email: map.parseValue('email'),
      token: map.parseValue('token'),
    );
  }
}
