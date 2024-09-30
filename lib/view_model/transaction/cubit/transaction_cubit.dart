import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skuy_pay_dashboard/models/transaction/transaction_api.dart';
import 'package:skuy_pay_dashboard/models/transaction/transaction_data.dart';
import 'package:skuy_pay_dashboard/models/transaction/transaction_params.dart';
import 'package:skuy_pay_dashboard/utils/const/toast.dart';

part 'transaction_state.dart';

class TransactionCubit extends Cubit<TransactionState> {
  TransactionCubit() : super(TransactionInitial());

  TransactionParams params = const TransactionParams();

  void setParams(Function(TransactionParams) params) {
    this.params = params(this.params);
  }

  void checkTransaction() {
    if (state is TransactionInitial || state is TransactionError) {
      getTransaction();
    }
  }

  Future<void> getTransaction() async {
    if (state is TransactionLoading) return;
    emit(TransactionLoading());

    TransactionApi.getTransactions(params).then((value) {
      emit(TransactionSuccess(transaction: value, searchTransaction: value));
    }).catchError((e) {
      toast(e.toString());
      emit(TransactionError(e.toString()));
    });
  }

  void search(String search) {
    final state = this.state;
    if (state is TransactionSuccess) {
      emit(TransactionSuccess(
        transaction: state.transaction,
        searchTransaction: state.transaction
            .where((element) =>
                element.toJson().toString().toLowerCase().contains(search))
            .toList(),
      ));
    }
  }
}
