import 'package:onedigital_customer/_all.dart';

class EmailPasswordAuthenticationRequestModel {
  final String? email;
  final String? password;

  EmailPasswordAuthenticationRequestModel({
    this.email,
    this.password,
  });

  EmailPasswordAuthenticationRequestModel copyWith({
    String? email,
    String? password,
  }) {
    return EmailPasswordAuthenticationRequestModel(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  factory EmailPasswordAuthenticationRequestModel.fromJson(Map<String, dynamic> json) {
    return EmailPasswordAuthenticationRequestModel(
      email: json.parseValue('email'),
      password: json.parseValue('password'),
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'email': email,
      'password': password,
    };
  }
}
