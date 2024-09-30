part of 'user_cubit.dart';

sealed class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

final class UserInitial extends UserState {}

final class UserLoading extends UserState {}

final class UserSuccess extends UserState {
  final List<UserData> user;
  final List<UserData> searchUser;

  const UserSuccess({required this.user, required this.searchUser});

  @override
  List<Object> get props => [user, searchUser];
}

final class UserError extends UserState {
  final String message;

  const UserError(this.message);
}
