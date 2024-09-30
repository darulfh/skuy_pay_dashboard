import 'package:skuy_pay_dashboard/models/params/params.dart';

class PpdParams extends Params {
  final String provider;

  const PpdParams({
    super.limit,
    super.page,
    this.provider = "",
  });

  @override
  List<Object?> get props => [limit, page, provider];

  PpdParams copyWith({
    int? limit,
    int? page,
    String? provider,
  }) {
    return PpdParams(
      limit: limit ?? this.limit,
      page: page ?? this.page,
      provider: provider ?? this.provider,
    );
  }

  Map<String, dynamic> toQueryParams() {
    return {
      'limit': limit,
      'page': page,
      if (provider != "") 'provider': provider,
    };
  }
}
