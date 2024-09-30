import 'package:flutter_bloc/flutter_bloc.dart';

class SideIndexCubit extends Cubit<int> {
  SideIndexCubit() : super(0);

  void setIndex(int index) => emit(index);
}
