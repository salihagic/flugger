import 'package:onedigital_customer/_all.dart';

class UpdatePersonalInfoRequestModel {
  final String? firstName;
  final String? middleName;
  final String? lastName;
  final String? phone;
  final GenderRequestModel gender;
  final String? birthDate;
  final String? profileImageUrl;
  final UpdatePersonalInfoAddressRequestModel address;

  UpdatePersonalInfoRequestModel({
    this.firstName,
    this.middleName,
    this.lastName,
    this.phone,
    required this.gender,
    this.birthDate,
    this.profileImageUrl,
    required this.address,
  });

  factory UpdatePersonalInfoRequestModel.fromMap(Map<String, dynamic> map) {
    return UpdatePersonalInfoRequestModel(
      firstName: map.parseValue('firstName'),
      middleName: map.parseValue('middleName'),
      lastName: map.parseValue('lastName'),
      phone: map.parseValue('phone'),
      gender: map.parseValue('gender'),
      birthDate: map.parseValue('birthDate'),
      profileImageUrl: map.parseValue('profileImageUrl'),
      address: map.parseValue('address'),
    );
  }
}
