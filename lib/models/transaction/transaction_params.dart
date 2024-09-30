import 'package:skuy_pay_dashboard/models/params/params.dart';

class TransactionParams extends Params {
  final String type;
  final String product;

  const TransactionParams({
    this.type = "",
    this.product = "",
    super.limit = 10,
    super.page = 1,
  });

  @override
  List<Object?> get props => [limit, page, type, product];

  TransactionParams copyWith({
    int? limit,
    int? page,
    String? type,
    String? product,
  }) {
    return TransactionParams(
      limit: limit ?? this.limit,
      page: page ?? this.page,
      type: type ?? this.type,
      product: product ?? this.product,
    );
  }

  Map<String, dynamic> toQueryParams() {
    return {
      'limit': limit,
      'page': page,
      if (type != "") 'type': type,
      if (product != "") 'product': product,
    };
  }
}
