import 'package:onedigital_customer/_all.dart';

class GenerateMagicLinkAuthenticationRequestModel {
  final String? email;

  GenerateMagicLinkAuthenticationRequestModel({
    this.email,
  });

  factory GenerateMagicLinkAuthenticationRequestModel.fromMap(Map<String, dynamic> map) {
    return GenerateMagicLinkAuthenticationRequestModel(
      email: map.parseValue('email'),
    );
  }
}
