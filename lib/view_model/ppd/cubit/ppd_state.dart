part of 'ppd_cubit.dart';

sealed class PpdState extends Equatable {
  const PpdState();

  @override
  List<Object> get props => [];
}

final class PpdInitial extends PpdState {}

final class PpdLoading extends PpdState {}

final class PpdDeleteLoading extends PpdState {}

final class PpdCreateLoading extends PpdState {}

final class PpdUpdateLoading extends PpdState {}

final class PpdSuccess extends PpdState {
  final List<PpdData> pulsa;
  final List<PpdData> paketData;

  final List<PpdData> searchPulsa;
  final List<PpdData> searchPaketData;

  const PpdSuccess({
    required this.paketData,
    required this.pulsa,
    required this.searchPulsa,
    required this.searchPaketData,
  });

  @override
  List<Object> get props => [pulsa, paketData, searchPulsa, searchPaketData];
}

final class PpdError extends PpdState {
  final String message;

  const PpdError(this.message);
}
