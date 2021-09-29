part of 'userauthenticate_bloc.dart';

abstract class UserauthenticateState extends Equatable {
  const UserauthenticateState();

  @override
  List<Object> get props => [];
}

class UserauthenticateInitial extends UserauthenticateState {}

class AuthenticationUninitialized extends UserauthenticateState {}

class AuthenticatedAuthenticated extends UserauthenticateState {}

class AuthenticationUnauthenticated extends UserauthenticateState {}

class AuthenticationLoading extends UserauthenticateState {}
