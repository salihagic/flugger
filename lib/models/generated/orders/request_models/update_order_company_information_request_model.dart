import 'package:onedigital_customer/_all.dart';

class UpdateOrderCompanyInformationRequestModel {
  final String? name;
  final String? vatId;

  UpdateOrderCompanyInformationRequestModel({
    this.name,
    this.vatId,
  });

  UpdateOrderCompanyInformationRequestModel copyWith({
    String? name,
    String? vatId,
  }) {
    return UpdateOrderCompanyInformationRequestModel(
      name: name ?? this.name,
      vatId: vatId ?? this.vatId,
    );
  }

  factory UpdateOrderCompanyInformationRequestModel.fromJson(Map<String, dynamic> json) {
    return UpdateOrderCompanyInformationRequestModel(
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
