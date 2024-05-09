import 'package:onedigital_customer/_all.dart';

class RefreshTokenRequestModel {
  final String? accessToken;
  final String? refreshToken;

  RefreshTokenRequestModel({
    this.accessToken,
    this.refreshToken,
  });

  RefreshTokenRequestModel copyWith({
    String? accessToken,
    String? refreshToken,
  }) {
    return RefreshTokenRequestModel(
      accessToken: accessToken ?? this.accessToken,
      refreshToken: refreshToken ?? this.refreshToken,
    );
  }

  factory RefreshTokenRequestModel.fromJson(Map<String, dynamic> json) {
    return RefreshTokenRequestModel(
      accessToken: json.parseValue('accessToken'),
      refreshToken: json.parseValue('refreshToken'),
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'accessToken': accessToken,
      'refreshToken': refreshToken,
    };
  }
}
