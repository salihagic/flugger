import 'package:onedigital_customer/_all.dart';

class CreateOrderPersonalInformationRequestModel {
  final String? firstName;
  final String? lastName;
  final Gender gender;
  final String? language;

  CreateOrderPersonalInformationRequestModel({
    this.firstName,
    this.lastName,
    required this.gender,
    this.language,
  });

  CreateOrderPersonalInformationRequestModel copyWith({
    String? firstName,
    String? lastName,
    Gender? gender,
    String? language,
  }) {
    return CreateOrderPersonalInformationRequestModel(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      gender: gender ?? this.gender,
      language: language ?? this.language,
    );
  }

  factory CreateOrderPersonalInformationRequestModel.fromJson(Map<String, dynamic> json) {
    return CreateOrderPersonalInformationRequestModel(
      firstName: json.parseValue('firstName'),
      lastName: json.parseValue('lastName'),
      gender: json.parse('gender', Gender.fromJson),
      language: json.parseValue('language'),
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'firstName': firstName,
      'lastName': lastName,
      'gender': gender,
      'language': language,
    };
  }
}
