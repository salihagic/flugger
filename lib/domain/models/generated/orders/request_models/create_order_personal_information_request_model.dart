import 'package:onedigital_customer/_all.dart';

class CreateOrderPersonalInformationRequestModel {
  final String? firstName;
  final String? lastName;
  final GenderRequestModel gender;
  final String? language;

  CreateOrderPersonalInformationRequestModel({
    this.firstName,
    this.lastName,
    required this.gender,
    this.language,
  });

  factory CreateOrderPersonalInformationRequestModel.fromMap(Map<String, dynamic> map) {
    return CreateOrderPersonalInformationRequestModel(
      firstName: map.parseValue('firstName'),
      lastName: map.parseValue('lastName'),
      gender: map.parseValue('gender'),
      language: map.parseValue('language'),
    );
  }
}
