import 'package:onedigital_customer/_all.dart';

class DisableAccountMultiFactorAuthenticationRequestModel {
  final String? password;

  DisableAccountMultiFactorAuthenticationRequestModel({
    this.password,
  });

  DisableAccountMultiFactorAuthenticationRequestModel copyWith({
    String? password,
  }) {
    return DisableAccountMultiFactorAuthenticationRequestModel(
      password: password ?? this.password,
    );
  }

  factory DisableAccountMultiFactorAuthenticationRequestModel.fromJson(Map<String, dynamic> json) {
    return DisableAccountMultiFactorAuthenticationRequestModel(
      password: json.parseValue('password'),
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'password': password,
    };
  }
}
