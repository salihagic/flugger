import 'package:onedigital_customer/_all.dart';

class UpdateOrderRequestModel {
  final String orderId;
  final String? subscriptionPlanOfferCode;
  final String subscriptionPlanId;
  final String? email;
  final UpdateOrderRequestPersonalInformation personalInformation;
  final UpdateOrderRequestCompanyInformation companyInformation;
  final UpdateOrderRequestPersonalInformationAddress address;
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

  UpdateOrderRequestModel copyWith({
    String? orderId,
    String? subscriptionPlanOfferCode,
    String? subscriptionPlanId,
    String? email,
    UpdateOrderRequestPersonalInformation? personalInformation,
    UpdateOrderRequestCompanyInformation? companyInformation,
    UpdateOrderRequestPersonalInformationAddress? address,
    bool? acceptedTermsAndConditions,
  }) {
    return UpdateOrderRequestModel(
      orderId: orderId ?? this.orderId,
      subscriptionPlanOfferCode: subscriptionPlanOfferCode ?? this.subscriptionPlanOfferCode,
      subscriptionPlanId: subscriptionPlanId ?? this.subscriptionPlanId,
      email: email ?? this.email,
      personalInformation: personalInformation ?? this.personalInformation,
      companyInformation: companyInformation ?? this.companyInformation,
      address: address ?? this.address,
      acceptedTermsAndConditions: acceptedTermsAndConditions ?? this.acceptedTermsAndConditions,
    );
  }

  factory UpdateOrderRequestModel.fromJson(Map<String, dynamic> json) {
    return UpdateOrderRequestModel(
      orderId: json.parseValue('orderId'),
      subscriptionPlanOfferCode: json.parseValue('subscriptionPlanOfferCode'),
      subscriptionPlanId: json.parseValue('subscriptionPlanId'),
      email: json.parseValue('email'),
      personalInformation: json.parse('personalInformation', UpdateOrderRequestPersonalInformation.fromJson),
      companyInformation: json.parse('companyInformation', UpdateOrderRequestCompanyInformation.fromJson),
      address: json.parse('address', UpdateOrderRequestPersonalInformationAddress.fromJson),
      acceptedTermsAndConditions: json.parseValue('acceptedTermsAndConditions'),
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'orderId': orderId,
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
