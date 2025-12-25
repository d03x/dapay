import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String id;
  final String name;
  final bool? isActivated;
  final String email;
  final String token;
  final String refreshToken;
  const UserModel({
    this.isActivated,
    required this.email,
    required this.token,
    required this.refreshToken,
    required this.id,
    required this.name,
  });
  factory UserModel.fromJson(Map<String, dynamic> data) {
    return UserModel(
      isActivated: data['isActivated'] ?? false,
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
      'is_activated': isActivated,
      'name': name,
      'email': email,
      'token': token,
      'refresh_token': refreshToken,
    };
  }

  @override
  List<Object> get props => ['id', 'token', 'refreshToken'];
}
