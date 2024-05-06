import 'package:onedigital_customer/_all.dart';

class SetAccountPasswordRequestModel {
  final String? newPassword;

  SetAccountPasswordRequestModel({
    this.newPassword,
  });

  factory SetAccountPasswordRequestModel.fromMap(Map<String, dynamic> map) {
    return SetAccountPasswordRequestModel(
      newPassword: map.parseValue('newPassword'),
    );
  }
}
