import 'package:onedigital_customer/_all.dart';

class UpdatePersonalInfoAddressRequestModel {
  final String? streetNumber;
  final String? street;
  final String? city;
  final String? state;
  final String? country;
  final String? zipCode;

  UpdatePersonalInfoAddressRequestModel({
    this.streetNumber,
    this.street,
    this.city,
    this.state,
    this.country,
    this.zipCode,
  });

  factory UpdatePersonalInfoAddressRequestModel.fromMap(Map<String, dynamic> map) {
    return UpdatePersonalInfoAddressRequestModel(
      streetNumber: map.parseValue('streetNumber'),
      street: map.parseValue('street'),
      city: map.parseValue('city'),
      state: map.parseValue('state'),
      country: map.parseValue('country'),
      zipCode: map.parseValue('zipCode'),
    );
  }
}
