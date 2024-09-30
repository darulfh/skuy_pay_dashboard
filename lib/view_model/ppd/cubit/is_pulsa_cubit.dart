import 'package:flutter_bloc/flutter_bloc.dart';

class IsPulsaCubit extends Cubit<bool> {
  IsPulsaCubit() : super(true);

  void changeIsPulsa(bool isPulsa) {
    emit(isPulsa);
  }
}
