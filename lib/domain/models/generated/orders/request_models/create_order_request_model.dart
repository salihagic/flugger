import 'package:onedigital_customer/_all.dart';

class CreateOrderRequestModel {
  final String? subscriptionPlanOfferCode;
  final String subscriptionPlanId;
  final String? email;
  final CreateOrderPersonalInformationRequestModel personalInformation;
  final CreateOrderCompanyInformationRequestModel companyInformation;
  final CreateOrderPersonalInformationAddressRequestModel address;
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

  factory CreateOrderRequestModel.fromMap(Map<String, dynamic> map) {
    return CreateOrderRequestModel(
      subscriptionPlanOfferCode: map.parseValue('subscriptionPlanOfferCode'),
      subscriptionPlanId: map.parseValue('subscriptionPlanId'),
      email: map.parseValue('email'),
      personalInformation: map.parseValue('personalInformation'),
      companyInformation: map.parseValue('companyInformation'),
      address: map.parseValue('address'),
      acceptedTermsAndConditions: map.parseValue('acceptedTermsAndConditions'),
    );
  }
}
