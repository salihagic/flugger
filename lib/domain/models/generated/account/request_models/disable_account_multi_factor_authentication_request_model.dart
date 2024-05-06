import 'package:onedigital_customer/_all.dart';

class DisableAccountMultiFactorAuthenticationRequestModel {
  final String? password;

  DisableAccountMultiFactorAuthenticationRequestModel({
    this.password,
  });

  factory DisableAccountMultiFactorAuthenticationRequestModel.fromMap(Map<String, dynamic> map) {
    return DisableAccountMultiFactorAuthenticationRequestModel(
      password: map.parseValue('password'),
    );
  }
}
