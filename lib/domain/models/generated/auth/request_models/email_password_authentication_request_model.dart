import 'package:onedigital_customer/_all.dart';

class EmailPasswordAuthenticationRequestModel {
  final String? email;
  final String? password;

  EmailPasswordAuthenticationRequestModel({
    this.email,
    this.password,
  });

  factory EmailPasswordAuthenticationRequestModel.fromMap(Map<String, dynamic> map) {
    return EmailPasswordAuthenticationRequestModel(
      email: map.parseValue('email'),
      password: map.parseValue('password'),
    );
  }
}
