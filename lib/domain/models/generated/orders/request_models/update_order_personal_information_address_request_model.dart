import 'package:onedigital_customer/_all.dart';

class UpdateOrderPersonalInformationAddressRequestModel {
  final String? street;
  final String? streetNumber;
  final String? city;
  final String? zipCode;
  final String? country;

  UpdateOrderPersonalInformationAddressRequestModel({
    this.street,
    this.streetNumber,
    this.city,
    this.zipCode,
    this.country,
  });

  factory UpdateOrderPersonalInformationAddressRequestModel.fromMap(Map<String, dynamic> map) {
    return UpdateOrderPersonalInformationAddressRequestModel(
      street: map.parseValue('street'),
      streetNumber: map.parseValue('streetNumber'),
      city: map.parseValue('city'),
      zipCode: map.parseValue('zipCode'),
      country: map.parseValue('country'),
    );
  }
}
