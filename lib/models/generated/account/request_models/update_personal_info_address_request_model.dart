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

  UpdatePersonalInfoAddressRequestModel copyWith({
    String? streetNumber,
    String? street,
    String? city,
    String? state,
    String? country,
    String? zipCode,
  }) {
    return UpdatePersonalInfoAddressRequestModel(
      streetNumber: streetNumber ?? this.streetNumber,
      street: street ?? this.street,
      city: city ?? this.city,
      state: state ?? this.state,
      country: country ?? this.country,
      zipCode: zipCode ?? this.zipCode,
    );
  }

  factory UpdatePersonalInfoAddressRequestModel.fromJson(Map<String, dynamic> json) {
    return UpdatePersonalInfoAddressRequestModel(
      streetNumber: json.parseValue('streetNumber'),
      street: json.parseValue('street'),
      city: json.parseValue('city'),
      state: json.parseValue('state'),
      country: json.parseValue('country'),
      zipCode: json.parseValue('zipCode'),
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'streetNumber': streetNumber,
      'street': street,
      'city': city,
      'state': state,
      'country': country,
      'zipCode': zipCode,
    };
  }
}
