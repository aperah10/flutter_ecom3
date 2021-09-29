part of 'userlogin_bloc.dart';

abstract class UserloginState extends Equatable {
  const UserloginState();

  @override
  List<Object> get props => [];
}

class UserloginInitial extends UserloginState {}

class LoginLoading extends UserloginState {}

class LoginSucccess extends UserloginState {}

class LoginFailure extends UserloginState {
  final String error;
  LoginFailure({required this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'LoginFailure(error: $error)';
}
