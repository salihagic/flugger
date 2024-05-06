import 'package:onedigital_customer/_all.dart';

class RefreshTokenRequestModel {
  final String? accessToken;
  final String? refreshToken;

  RefreshTokenRequestModel({
    this.accessToken,
    this.refreshToken,
  });

  factory RefreshTokenRequestModel.fromMap(Map<String, dynamic> map) {
    return RefreshTokenRequestModel(
      accessToken: map.parseValue('accessToken'),
      refreshToken: map.parseValue('refreshToken'),
    );
  }
}
