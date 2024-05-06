import 'package:onedigital_customer/_all.dart';

class ExchangeTokenRequestModel {
  final String? token;

  ExchangeTokenRequestModel({
    this.token,
  });

  factory ExchangeTokenRequestModel.fromMap(Map<String, dynamic> map) {
    return ExchangeTokenRequestModel(
      token: map.parseValue('token'),
    );
  }
}
