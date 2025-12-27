import 'package:equatable/equatable.dart';

class JwtAuthModel extends Equatable {
  final int expires;
  final String token;
  final String? refreshToken;
  const JwtAuthModel({
    required this.token,
    this.refreshToken,
    required this.expires,
  });
  factory JwtAuthModel.fromJson(Map<String, dynamic> data) {
    return JwtAuthModel(
      token: data['access_token'] ?? false,
      refreshToken: data['refresh_token'],
      expires: data['expires_in'],
    );
  }
  Map<String, dynamic> toJson() {
    return {'expires': expires, 'token': token, 'refresh_token': refreshToken};
  }

  @override
  List<Object> get props => [token, expires];
}
