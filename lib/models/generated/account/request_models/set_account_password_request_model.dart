import 'package:onedigital_customer/_all.dart';

class SetAccountPasswordRequestModel {
  final String? newPassword;

  SetAccountPasswordRequestModel({
    this.newPassword,
  });

  SetAccountPasswordRequestModel copyWith({
    String? newPassword,
  }) {
    return SetAccountPasswordRequestModel(
      newPassword: newPassword ?? this.newPassword,
    );
  }

  factory SetAccountPasswordRequestModel.fromJson(Map<String, dynamic> json) {
    return SetAccountPasswordRequestModel(
      newPassword: json.parseValue('newPassword'),
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'newPassword': newPassword,
    };
  }
}
