import 'package:skuy_pay_dashboard/models/params/params.dart';

class UserParams extends Params {
  final String name;

  const UserParams({
    super.limit = 10,
    super.page = 1,
    this.name = "",
  });

  @override
  List<Object?> get props => [limit, page, name];

  UserParams copyWith({
    int? limit,
    int? page,
    String? name,
  }) {
    return UserParams(
      limit: limit ?? this.limit,
      page: page ?? this.page,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toQueryParams() {
    return {
      'limit': limit,
      'page': page,
      if (name != "") 'name': name,
    };
  }
}
