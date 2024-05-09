import 'package:onedigital_customer/_all.dart';

class ForgotPasswordRequestModel {
  final String? email;

  ForgotPasswordRequestModel({
    this.email,
  });

  ForgotPasswordRequestModel copyWith({
    String? email,
  }) {
    return ForgotPasswordRequestModel(
      email: email ?? this.email,
    );
  }

  factory ForgotPasswordRequestModel.fromJson(Map<String, dynamic> json) {
    return ForgotPasswordRequestModel(
      email: json.parseValue('email'),
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'email': email,
    };
  }
}
