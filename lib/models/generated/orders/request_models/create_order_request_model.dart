import 'package:onedigital_customer/_all.dart';

class CreateOrderRequestModel {
  final String? subscriptionPlanOfferCode;
  final String subscriptionPlanId;
  final String? email;
  final CreateOrderRequestPersonalInformation personalInformation;
  final CreateOrderRequestCompanyInformation companyInformation;
  final CreateOrderRequestPersonalInformationAddress address;
  final bool acceptedTermsAndConditions;

  CreateOrderRequestModel({
    this.subscriptionPlanOfferCode,
    required this.subscriptionPlanId,
    this.email,
    required this.personalInformation,
    required this.companyInformation,
    required this.address,
    required this.acceptedTermsAndConditions,
  });

  CreateOrderRequestModel copyWith({
    String? subscriptionPlanOfferCode,
    String? subscriptionPlanId,
    String? email,
    CreateOrderRequestPersonalInformation? personalInformation,
    CreateOrderRequestCompanyInformation? companyInformation,
    CreateOrderRequestPersonalInformationAddress? address,
    bool? acceptedTermsAndConditions,
  }) {
    return CreateOrderRequestModel(
      subscriptionPlanOfferCode: subscriptionPlanOfferCode ?? this.subscriptionPlanOfferCode,
      subscriptionPlanId: subscriptionPlanId ?? this.subscriptionPlanId,
      email: email ?? this.email,
      personalInformation: personalInformation ?? this.personalInformation,
      companyInformation: companyInformation ?? this.companyInformation,
      address: address ?? this.address,
      acceptedTermsAndConditions: acceptedTermsAndConditions ?? this.acceptedTermsAndConditions,
    );
  }

  factory CreateOrderRequestModel.fromJson(Map<String, dynamic> json) {
    return CreateOrderRequestModel(
      subscriptionPlanOfferCode: json.parseValue('subscriptionPlanOfferCode'),
      subscriptionPlanId: json.parseValue('subscriptionPlanId'),
      email: json.parseValue('email'),
      personalInformation: json.parse('personalInformation', CreateOrderRequestPersonalInformation.fromJson),
      companyInformation: json.parse('companyInformation', CreateOrderRequestCompanyInformation.fromJson),
      address: json.parse('address', CreateOrderRequestPersonalInformationAddress.fromJson),
      acceptedTermsAndConditions: json.parseValue('acceptedTermsAndConditions'),
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'subscriptionPlanOfferCode': subscriptionPlanOfferCode,
      'subscriptionPlanId': subscriptionPlanId,
      'email': email,
      'personalInformation': personalInformation,
      'companyInformation': companyInformation,
      'address': address,
      'acceptedTermsAndConditions': acceptedTermsAndConditions,
    };
  }
}
