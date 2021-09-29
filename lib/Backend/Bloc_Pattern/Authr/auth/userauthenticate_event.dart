part of 'userauthenticate_bloc.dart';

abstract class UserauthenticateEvent extends Equatable {
  const UserauthenticateEvent();

  @override
  List<Object> get props => [];
}

class AppStarted extends UserauthenticateEvent {}

/* -------------------------------------------------------------------------- */
/*                                SIGNED EVENT                                */
/* -------------------------------------------------------------------------- */
class SignedIn extends UserauthenticateEvent {
  final String regtoken;
  SignedIn({required this.regtoken});

  @override
  List<Object> get props => [regtoken];

  @override
  String toString() => 'SigngedIn { regtoken: $regtoken }';
}

class LoggedIn extends UserauthenticateEvent {
  final String usertoken;
  // final bool usertoken;
  LoggedIn({required this.usertoken});

  @override
  List<Object> get props => [usertoken];

  @override
  String toString() => 'LoggedIn { usertoken: $usertoken }';
}

class LoggedOut extends UserauthenticateEvent {}
