import 'package:onedigital_customer/_all.dart';

class GenerateMagicLinkAuthenticationRequestModel {
  final String? email;

  GenerateMagicLinkAuthenticationRequestModel({
    this.email,
  });

  GenerateMagicLinkAuthenticationRequestModel copyWith({
    String? email,
  }) {
    return GenerateMagicLinkAuthenticationRequestModel(
      email: email ?? this.email,
    );
  }

  factory GenerateMagicLinkAuthenticationRequestModel.fromJson(Map<String, dynamic> json) {
    return GenerateMagicLinkAuthenticationRequestModel(
      email: json.parseValue('email'),
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'email': email,
    };
  }
}
