import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skuy_pay_dashboard/models/auth/auth_api.dart';
import 'package:skuy_pay_dashboard/models/auth/auth_params.dart';
import 'package:skuy_pay_dashboard/utils/const/toast.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  Future<void> login(AuthParams params) async {
    emit(LoginLoading());

    AuthApi.login(params).then((value) {
      emit(LoginSuccess());
    }).catchError((e) {
      toast(e.toString());
      emit(LoginError(e.toString()));
    });
  }
}
