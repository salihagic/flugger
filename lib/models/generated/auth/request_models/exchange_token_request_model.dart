import 'package:onedigital_customer/_all.dart';

class ExchangeTokenRequestModel {
  final String? token;

  ExchangeTokenRequestModel({
    this.token,
  });

  ExchangeTokenRequestModel copyWith({
    String? token,
  }) {
    return ExchangeTokenRequestModel(
      token: token ?? this.token,
    );
  }

  factory ExchangeTokenRequestModel.fromJson(Map<String, dynamic> json) {
    return ExchangeTokenRequestModel(
      token: json.parseValue('token'),
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'token': token,
    };
  }
}
