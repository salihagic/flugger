import 'package:onedigital_customer/_all.dart';

class CreateOrderCompanyInformationRequestModel {
  final String? name;
  final String? vatId;

  CreateOrderCompanyInformationRequestModel({
    this.name,
    this.vatId,
  });

  CreateOrderCompanyInformationRequestModel copyWith({
    String? name,
    String? vatId,
  }) {
    return CreateOrderCompanyInformationRequestModel(
      name: name ?? this.name,
      vatId: vatId ?? this.vatId,
    );
  }

  factory CreateOrderCompanyInformationRequestModel.fromJson(Map<String, dynamic> json) {
    return CreateOrderCompanyInformationRequestModel(
      name: json.parseValue('name'),
      vatId: json.parseValue('vatId'),
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'name': name,
      'vatId': vatId,
    };
  }
}
