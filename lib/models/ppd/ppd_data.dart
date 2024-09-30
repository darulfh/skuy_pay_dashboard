import 'package:equatable/equatable.dart';

class PpdData extends Equatable {
  final String id;
  final String name;
  final String type;
  final String code;
  final String provider;
  final double price;
  final bool isActive;
  final String description;

  const PpdData({
    this.id = "",
    this.name = "",
    this.type = "",
    this.code = "",
    this.provider = "",
    this.price = 0,
    this.isActive = false,
    this.description = "",
  });

  @override
  List<Object?> get props =>
      [id, name, type, code, provider, price, isActive, description];

  PpdData copyWith({
    String? id,
    String? name,
    String? type,
    String? code,
    String? provider,
    double? price,
    bool? isActive,
    String? description,
  }) {
    return PpdData(
      id: id ?? this.id,
      name: name ?? this.name,
      type: type ?? this.type,
      code: code ?? this.code,
      provider: provider ?? this.provider,
      price: price ?? this.price,
      isActive: isActive ?? this.isActive,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'type': type,
      'code': code,
      'provider': provider,
      'price': price,
      'is_active': isActive,
      'description': description,
    };
  }

  Map<String, dynamic> toParams() {
    return {
      'name': name,
      'type': type,
      'code': code,
      'provider': provider,
      'price': price,
      'is_active': isActive,
      'description': description,
    };
  }

  factory PpdData.fromJson(Map<String, dynamic> json) {
    return PpdData(
      id: json['id'] as String? ?? "",
      name: json['name'] as String? ?? "",
      type: json['type'] as String? ?? "",
      code: json['code'] as String? ?? "",
      provider: json['provider'] as String? ?? "",
      price: json['price'] as double? ?? 0,
      isActive: json['is_active'] as bool? ?? false,
      description: json['description'] as String? ?? "",
    );
  }
}
