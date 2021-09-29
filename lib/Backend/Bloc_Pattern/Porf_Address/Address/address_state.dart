part of 'address_bloc.dart';

abstract class AddressState extends Equatable {
  const AddressState();

  @override
  List<Object> get props => [];
}

class AddressInitial extends AddressState {}

/* -------------------------------------------------------------------------- */
/*                     // !  Address STATE                                   */
/* -------------------------------------------------------------------------- */

class AddressLoadingState extends AddressState {}

// !  Address LOADED GET REQUEST METHOD
class AddressLoadedState extends AddressState {
  List<Address> addressData;

  AddressLoadedState({required this.addressData});

  @override
  List<Object> get props => [];
}

// ! END Address DATA
class AddressSuccessState extends AddressState {}

class AddressErrorState extends AddressState {
  late String error;
  AddressErrorState({required this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'AddressFailure(error: $error)';
}
