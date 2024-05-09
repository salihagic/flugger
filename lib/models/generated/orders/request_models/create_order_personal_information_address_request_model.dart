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

  CreateOrderPersonalInformationAddressRequestModel copyWith({
    String? street,
    String? streetNumber,
    String? city,
    String? zipCode,
    String? country,
  }) {
    return CreateOrderPersonalInformationAddressRequestModel(
      street: street ?? this.street,
      streetNumber: streetNumber ?? this.streetNumber,
      city: city ?? this.city,
      zipCode: zipCode ?? this.zipCode,
      country: country ?? this.country,
    );
  }

  factory CreateOrderPersonalInformationAddressRequestModel.fromJson(Map<String, dynamic> json) {
    return CreateOrderPersonalInformationAddressRequestModel(
      street: json.parseValue('street'),
      streetNumber: json.parseValue('streetNumber'),
      city: json.parseValue('city'),
      zipCode: json.parseValue('zipCode'),
      country: json.parseValue('country'),
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'street': street,
      'streetNumber': streetNumber,
      'city': city,
      'zipCode': zipCode,
      'country': country,
    };
  }
}
