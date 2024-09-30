import 'package:equatable/equatable.dart';

class UserData extends Equatable {
  final String id;
  final String name;
  final String email;
  final int balance;
  final String pin;
  final String phone;
  final String image;
  final String address;
  final String createdAt;
  final String updatedAt;

  const UserData({
    this.id = "",
    this.name = "",
    this.email = "",
    this.balance = 0,
    this.pin = "",
    this.phone = "",
    this.image = "",
    this.address = "",
    this.createdAt = "",
    this.updatedAt = "",
  });

  @override
  List<Object?> get props => [
        id,
        name,
        email,
        balance,
        pin,
        phone,
        image,
        address,
        createdAt,
        updatedAt
      ];

  UserData copyWith({
    String? id,
    String? name,
    String? email,
    int? balance,
    String? pin,
    String? phone,
    String? image,
    String? address,
    String? createdAt,
    String? updatedAt,
  }) {
    return UserData(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      balance: balance ?? this.balance,
      pin: pin ?? this.pin,
      phone: phone ?? this.phone,
      image: image ?? this.image,
      address: address ?? this.address,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'balance': balance,
      'pin': pin,
      'phone': phone,
      'image': image,
      'address': address,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      id: json['id'] as String? ?? "",
      name: json['name'] as String? ?? "",
      email: json['email'] as String? ?? "",
      balance: json['balance'] as int? ?? 0,
      pin: json['pin'] as String? ?? "",
      phone: json['phone'] as String? ?? "",
      image: json['image'] as String? ?? "",
      address: json['address'] as String? ?? "",
      createdAt: json['created_at'] as String? ?? "",
      updatedAt: json['updated_at'] as String? ?? "",
    );
  }
}
