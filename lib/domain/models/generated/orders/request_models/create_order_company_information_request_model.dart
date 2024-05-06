import 'package:onedigital_customer/_all.dart';

class CreateOrderCompanyInformationRequestModel {
  final String? name;
  final String? vatId;

  CreateOrderCompanyInformationRequestModel({
    this.name,
    this.vatId,
  });

  factory CreateOrderCompanyInformationRequestModel.fromMap(Map<String, dynamic> map) {
    return CreateOrderCompanyInformationRequestModel(
      name: map.parseValue('name'),
      vatId: map.parseValue('vatId'),
    );
  }
}
