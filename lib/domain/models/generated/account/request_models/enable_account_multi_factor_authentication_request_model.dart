import 'package:onedigital_customer/_all.dart';

class EnableAccountMultiFactorAuthenticationRequestModel {
  final String? code;

  EnableAccountMultiFactorAuthenticationRequestModel({
    this.code,
  });

  factory EnableAccountMultiFactorAuthenticationRequestModel.fromMap(Map<String, dynamic> map) {
    return EnableAccountMultiFactorAuthenticationRequestModel(
      code: map.parseValue('code'),
    );
  }
}
