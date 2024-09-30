import 'package:equatable/equatable.dart';

class AuthData extends Equatable {
  final String id;
  final String name;
  final String email;
  final String token;

  const AuthData({
    this.id = "",
    this.name = "",
    this.email = "",
    this.token = "",
  });

  @override
  List<Object?> get props => [id, name, email, token];

  AuthData copyWith({
    String? id,
    String? name,
    String? email,
    String? token,
  }) {
    return AuthData(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      token: token ?? this.token,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'token': token,
    };
  }

  factory AuthData.fromJson(Map<String, dynamic> json) {
    return AuthData(
      id: json['id'] as String? ?? "",
      name: json['name'] as String? ?? "",
      email: json['email'] as String? ?? "",
      token: json['token'] as String? ?? "",
    );
  }
}
