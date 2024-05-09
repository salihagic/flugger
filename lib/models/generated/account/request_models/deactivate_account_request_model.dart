import 'package:onedigital_customer/_all.dart';

class DeactivateAccountRequestModel {
  final bool acceptedDeactivationTermsAndConditions;
  final String? password;

  DeactivateAccountRequestModel({
    required this.acceptedDeactivationTermsAndConditions,
    this.password,
  });

  DeactivateAccountRequestModel copyWith({
    bool? acceptedDeactivationTermsAndConditions,
    String? password,
  }) {
    return DeactivateAccountRequestModel(
      acceptedDeactivationTermsAndConditions: acceptedDeactivationTermsAndConditions ?? this.acceptedDeactivationTermsAndConditions,
      password: password ?? this.password,
    );
  }

  factory DeactivateAccountRequestModel.fromJson(Map<String, dynamic> json) {
    return DeactivateAccountRequestModel(
      acceptedDeactivationTermsAndConditions: json.parseValue('acceptedDeactivationTermsAndConditions'),
      password: json.parseValue('password'),
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'acceptedDeactivationTermsAndConditions': acceptedDeactivationTermsAndConditions,
      'password': password,
    };
  }
}
