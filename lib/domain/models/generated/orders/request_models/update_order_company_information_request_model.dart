import 'package:onedigital_customer/_all.dart';

class UpdateOrderCompanyInformationRequestModel {
  final String? name;
  final String? vatId;

  UpdateOrderCompanyInformationRequestModel({
    this.name,
    this.vatId,
  });

  factory UpdateOrderCompanyInformationRequestModel.fromMap(Map<String, dynamic> map) {
    return UpdateOrderCompanyInformationRequestModel(
      name: map.parseValue('name'),
      vatId: map.parseValue('vatId'),
    );
  }
}
