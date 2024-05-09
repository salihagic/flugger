import 'package:flugger/models/generated/account/request_models/update_personal_info_address_request_model.dart';
import 'package:onedigital_customer/_all.dart';

class UpdatePersonalInfoRequestModel {
  final String? firstName;
  final String? middleName;
  final String? lastName;
  final String? phone;
  final Gender gender;
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

  UpdatePersonalInfoRequestModel copyWith({
    String? firstName,
    String? middleName,
    String? lastName,
    String? phone,
    Gender? gender,
    String? birthDate,
    String? profileImageUrl,
    UpdatePersonalInfoRequestAddress? address,
  }) {
    return UpdatePersonalInfoRequestModel(
      firstName: firstName ?? this.firstName,
      middleName: middleName ?? this.middleName,
      lastName: lastName ?? this.lastName,
      phone: phone ?? this.phone,
      gender: gender ?? this.gender,
      birthDate: birthDate ?? this.birthDate,
      profileImageUrl: profileImageUrl ?? this.profileImageUrl,
      address: address ?? this.address,
    );
  }

  factory UpdatePersonalInfoRequestModel.fromJson(Map<String, dynamic> json) {
    return UpdatePersonalInfoRequestModel(
      firstName: json.parseValue('firstName'),
      middleName: json.parseValue('middleName'),
      lastName: json.parseValue('lastName'),
      phone: json.parseValue('phone'),
      gender: json.parse('gender', Gender.fromJson),
      birthDate: json.parseValue('birthDate'),
      profileImageUrl: json.parseValue('profileImageUrl'),
      address: json.parse('address', UpdatePersonalInfoRequestAddress.fromJson),
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'firstName': firstName,
      'middleName': middleName,
      'lastName': lastName,
      'phone': phone,
      'gender': gender,
      'birthDate': birthDate,
      'profileImageUrl': profileImageUrl,
      'address': address,
    };
  }
}
