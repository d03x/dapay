import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String id;
  final String name;
  final String email;
  final String token;
  final String refreshToken;
  const UserModel({
    required this.email,
    required this.token,
    required this.refreshToken,
    required this.id,
    required this.name,
  });
  factory UserModel.fromJson(Map<String, dynamic> data) {
    return UserModel(
      email: data['email'],
      token: data['token'],
      refreshToken: data['refresh_token'],
      id: data['id'],
      name: data['name'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'token': token,
      'refresh_token': refreshToken,
    };
  }

  @override
  List<Object> get props => ['id', 'token', 'refreshToken'];
}
