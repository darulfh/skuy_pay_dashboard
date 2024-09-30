import 'package:equatable/equatable.dart';

class Params extends Equatable {
  final int limit;
  final int page;

  const Params({
    this.limit = 10,
    this.page = 1,
  });

  @override
  List<Object?> get props => [
        limit,
        page,
      ];
}
