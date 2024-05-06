import 'package:onedigital_customer/_all.dart';

class DeactivateAccountRequestModel {
  final bool acceptedDeactivationTermsAndConditions;
  final String? password;

  DeactivateAccountRequestModel({
    required this.acceptedDeactivationTermsAndConditions,
    this.password,
  });

  factory DeactivateAccountRequestModel.fromMap(Map<String, dynamic> map) {
    return DeactivateAccountRequestModel(
      acceptedDeactivationTermsAndConditions: map.parseValue('acceptedDeactivationTermsAndConditions'),
      password: map.parseValue('password'),
    );
  }
}
