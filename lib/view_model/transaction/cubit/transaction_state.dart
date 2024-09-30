part of 'transaction_cubit.dart';

sealed class TransactionState extends Equatable {
  const TransactionState();

  @override
  List<Object> get props => [];
}

final class TransactionInitial extends TransactionState {}

final class TransactionLoading extends TransactionState {}

final class TransactionSuccess extends TransactionState {
  final List<TransactionData> transaction;
  final List<TransactionData> searchTransaction;

  const TransactionSuccess(
      {required this.transaction, required this.searchTransaction});

  @override
  List<Object> get props => [transaction, searchTransaction];

  int getTotalToday() {
    return transaction
        .where((element) =>
            element.createdAt ==
            DateTime.now().toIso8601String().substring(0, 10))
        .length;
  }
}

final class TransactionError extends TransactionState {
  final String message;

  const TransactionError(this.message);
}
