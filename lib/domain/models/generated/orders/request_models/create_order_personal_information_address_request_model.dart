import 'package:onedigital_customer/_all.dart';

class CreateOrderPersonalInformationAddressRequestModel {
  final String? street;
  final String? streetNumber;
  final String? city;
  final String? zipCode;
  final String? country;

  CreateOrderPersonalInformationAddressRequestModel({
    this.street,
    this.streetNumber,
    this.city,
    this.zipCode,
    this.country,
  });

  factory CreateOrderPersonalInformationAddressRequestModel.fromMap(Map<String, dynamic> map) {
    return CreateOrderPersonalInformationAddressRequestModel(
      street: map.parseValue('street'),
      streetNumber: map.parseValue('streetNumber'),
      city: map.parseValue('city'),
      zipCode: map.parseValue('zipCode'),
      country: map.parseValue('country'),
    );
  }
}
