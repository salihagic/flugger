import 'package:onedigital_customer/_all.dart';

class UpdateOrderPersonalInformationRequestModel {
  final String? firstName;
  final String? lastName;
  final GenderRequestModel gender;
  final String? language;

  UpdateOrderPersonalInformationRequestModel({
    this.firstName,
    this.lastName,
    required this.gender,
    this.language,
  });

  factory UpdateOrderPersonalInformationRequestModel.fromMap(Map<String, dynamic> map) {
    return UpdateOrderPersonalInformationRequestModel(
      firstName: map.parseValue('firstName'),
      lastName: map.parseValue('lastName'),
      gender: map.parseValue('gender'),
      language: map.parseValue('language'),
    );
  }
}
