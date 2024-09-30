import 'package:equatable/equatable.dart';

class TransactionData extends Equatable {
  final String id;
  final String userId;
  final String status;
  final String productType;
  final dynamic productDetail;
  final String description;
  final int discountPrice;
  final int adminFee;
  final int price;
  final int totalPrice;
  final String createdAt;
  final String updatedAt;
  final String deletedAt;

  const TransactionData({
    this.id = "",
    this.userId = "",
    this.status = "",
    this.productType = "",
    this.productDetail,
    this.description = "",
    this.discountPrice = 0,
    this.adminFee = 0,
    this.price = 0,
    this.totalPrice = 0,
    this.createdAt = "",
    this.updatedAt = "",
    this.deletedAt = "",
  });

  @override
  List<Object?> get props => [
        id,
        userId,
        status,
        productType,
        productDetail,
        description,
        discountPrice,
        adminFee,
        price,
        totalPrice,
        createdAt,
        updatedAt,
        deletedAt
      ];

  TransactionData copyWith({
    String? id,
    String? userId,
    String? status,
    String? productType,
    dynamic productDetail,
    String? description,
    int? discountPrice,
    int? adminFee,
    int? price,
    int? totalPrice,
    String? createdAt,
    String? updatedAt,
    String? deletedAt,
  }) {
    return TransactionData(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      status: status ?? this.status,
      productType: productType ?? this.productType,
      productDetail: productDetail ?? this.productDetail,
      description: description ?? this.description,
      discountPrice: discountPrice ?? this.discountPrice,
      adminFee: adminFee ?? this.adminFee,
      price: price ?? this.price,
      totalPrice: totalPrice ?? this.totalPrice,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'status': status,
      'product_type': productType,
      'product_detail': productDetail,
      'description': description,
      'discount_price': discountPrice,
      'admin_fee': adminFee,
      'price': price,
      'total_price': totalPrice,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'deleted_at': deletedAt,
    };
  }

  factory TransactionData.fromJson(Map<String, dynamic> json) {
    return TransactionData(
      id: json['id'] as String? ?? "",
      userId: json['user_id'] as String? ?? "",
      status: json['status'] as String? ?? "",
      productType: json['product_type'] as String? ?? "",
      productDetail: json['product_detail'],
      description: json['description'] as String? ?? "",
      discountPrice: json['discount_price'] as int? ?? 0,
      adminFee: json['admin_fee'] as int? ?? 0,
      price: json['price'] as int? ?? 0,
      totalPrice: json['total_price'] as int? ?? 0,
      createdAt: json['created_at'] as String? ?? "",
      updatedAt: json['updated_at'] as String? ?? "",
      deletedAt: json['deleted_at'] as String? ?? "",
    );
  }
}
