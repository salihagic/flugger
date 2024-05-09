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

  UpdateOrderPersonalInformationAddressRequestModel copyWith({
    String? street,
    String? streetNumber,
    String? city,
    String? zipCode,
    String? country,
  }) {
    return UpdateOrderPersonalInformationAddressRequestModel(
      street: street ?? this.street,
      streetNumber: streetNumber ?? this.streetNumber,
      city: city ?? this.city,
      zipCode: zipCode ?? this.zipCode,
      country: country ?? this.country,
    );
  }

  factory UpdateOrderPersonalInformationAddressRequestModel.fromJson(Map<String, dynamic> json) {
    return UpdateOrderPersonalInformationAddressRequestModel(
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
