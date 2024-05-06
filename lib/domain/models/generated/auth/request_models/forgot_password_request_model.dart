import 'package:onedigital_customer/_all.dart';

class ForgotPasswordRequestModel {
  final String? email;

  ForgotPasswordRequestModel({
    this.email,
  });

  factory ForgotPasswordRequestModel.fromMap(Map<String, dynamic> map) {
    return ForgotPasswordRequestModel(
      email: map.parseValue('email'),
    );
  }
}
