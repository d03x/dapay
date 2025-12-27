import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String id;
  final String name;
  final bool? isActivated;
  final String email;
  const UserModel({
    this.isActivated,
    required this.email,
    required this.id,
    required this.name,
  });
  factory UserModel.fromJson(Map<String, dynamic> data) {
    return UserModel(
      isActivated: data['isActivated'] ?? false,
      email: data['email'],
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
    };
  }

  @override
  List<Object> get props => [id, name];
}
