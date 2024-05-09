import 'package:onedigital_customer/_all.dart';

class AuthenticateMagicLinkRequestModel {
  final String? email;
  final String? token;

  AuthenticateMagicLinkRequestModel({
    this.email,
    this.token,
  });

  AuthenticateMagicLinkRequestModel copyWith({
    String? email,
    String? token,
  }) {
    return AuthenticateMagicLinkRequestModel(
      email: email ?? this.email,
      token: token ?? this.token,
    );
  }

  factory AuthenticateMagicLinkRequestModel.fromJson(Map<String, dynamic> json) {
    return AuthenticateMagicLinkRequestModel(
      email: json.parseValue('email'),
      token: json.parseValue('token'),
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'email': email,
      'token': token,
    };
  }
}
