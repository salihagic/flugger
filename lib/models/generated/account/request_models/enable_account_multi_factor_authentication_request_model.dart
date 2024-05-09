import 'package:onedigital_customer/_all.dart';

class EnableAccountMultiFactorAuthenticationRequestModel {
  final String? code;

  EnableAccountMultiFactorAuthenticationRequestModel({
    this.code,
  });

  EnableAccountMultiFactorAuthenticationRequestModel copyWith({
    String? code,
  }) {
    return EnableAccountMultiFactorAuthenticationRequestModel(
      code: code ?? this.code,
    );
  }

  factory EnableAccountMultiFactorAuthenticationRequestModel.fromJson(Map<String, dynamic> json) {
    return EnableAccountMultiFactorAuthenticationRequestModel(
      code: json.parseValue('code'),
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'code': code,
    };
  }
}
