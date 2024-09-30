import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skuy_pay_dashboard/models/user/user_api.dart';
import 'package:skuy_pay_dashboard/models/user/user_data.dart';
import 'package:skuy_pay_dashboard/models/user/user_params.dart';
import 'package:skuy_pay_dashboard/utils/const/toast.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());

  UserParams params = const UserParams();

  void setParams(Function(UserParams) params) {
    this.params = params(this.params);
  }

  void checkUser() {
    if (state is UserInitial || state is UserError) {
      getUser();
    }
  }

  Future<void> getUser() async {
    if (state is UserLoading) return;

    emit(UserLoading());

    UserApi.getUsers(params).then((value) {
      emit(UserSuccess(searchUser: value, user: value));
    }).catchError((e) {
      toast(e.toString());
      emit(UserError(e.toString()));
    });
  }

  void getUserSearch(String search) {
    final state = this.state;
    if (state is UserSuccess) {
      emit(UserSuccess(
        user: state.user,
        searchUser: state.user
            .where((element) =>
                element.toJson().toString().toLowerCase().contains(search))
            .toList(),
      ));
    }
  }
}
