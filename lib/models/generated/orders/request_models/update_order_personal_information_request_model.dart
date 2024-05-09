import 'package:onedigital_customer/_all.dart';

class UpdateOrderPersonalInformationRequestModel {
  final String? firstName;
  final String? lastName;
  final Gender gender;
  final String? language;

  UpdateOrderPersonalInformationRequestModel({
    this.firstName,
    this.lastName,
    required this.gender,
    this.language,
  });

  UpdateOrderPersonalInformationRequestModel copyWith({
    String? firstName,
    String? lastName,
    Gender? gender,
    String? language,
  }) {
    return UpdateOrderPersonalInformationRequestModel(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      gender: gender ?? this.gender,
      language: language ?? this.language,
    );
  }

  factory UpdateOrderPersonalInformationRequestModel.fromJson(Map<String, dynamic> json) {
    return UpdateOrderPersonalInformationRequestModel(
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
