part of 'userlogin_bloc.dart';

abstract class UserloginEvent extends Equatable {
  const UserloginEvent();

  @override
  List<Object> get props => [];
}

class LoginBtn extends UserloginEvent {
  final String phone;
  final String password;
  LoginBtn({required this.phone, required this.password});

  @override
  List<Object> get props => [phone, password];

  @override
  String toString() =>
      'LoginBtnPressed { username: $phone, password: $password }';
}
