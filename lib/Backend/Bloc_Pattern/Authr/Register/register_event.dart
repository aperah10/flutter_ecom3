part of 'register_bloc.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

class SignUpBtn extends RegisterEvent {
  final String email, password, fullname, phone;
  SignUpBtn(
      {required this.email,
      required this.fullname,
      required this.phone,
      required this.password});
}
