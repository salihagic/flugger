import 'package:onedigital_customer/_all.dart';

class UpdateOrderRequestModel {
  final String orderId;
  final String? subscriptionPlanOfferCode;
  final String subscriptionPlanId;
  final String? email;
  final UpdateOrderPersonalInformationRequestModel personalInformation;
  final UpdateOrderCompanyInformationRequestModel companyInformation;
  final UpdateOrderPersonalInformationAddressRequestModel address;
  final bool acceptedTermsAndConditions;

  UpdateOrderRequestModel({
    required this.orderId,
    this.subscriptionPlanOfferCode,
    required this.subscriptionPlanId,
    this.email,
    required this.personalInformation,
    required this.companyInformation,
    required this.address,
    required this.acceptedTermsAndConditions,
  });

  factory UpdateOrderRequestModel.fromMap(Map<String, dynamic> map) {
    return UpdateOrderRequestModel(
      orderId: map.parseValue('orderId'),
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
