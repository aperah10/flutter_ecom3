part of 'orderpage_bloc.dart';

abstract class OrderpageState extends Equatable {
  const OrderpageState();

  @override
  List<Object> get props => [];
}

class OrderpageInitial extends OrderpageState {}

class OrderLoading extends OrderpageState {}

class OrderSucccess extends OrderpageState {}

class OrderFailure extends OrderpageState {
  final String error;
  OrderFailure({required this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'LoginFailure(error: $error)';
}
