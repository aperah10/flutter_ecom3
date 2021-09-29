part of 'cartp_bloc.dart';

abstract class CartpEvent extends Equatable {
  CartpEvent();

  @override
  List<Object> get props => [];
}

class FetchCartEvent extends CartpEvent {
  @override
  List<Object> get props => [];
}

class CartInitializedEvent extends CartpEvent {}

class ItemAddingCartEvent extends CartpEvent {
  List<NewCart> cartItems;

  ItemAddingCartEvent({required this.cartItems});

  @override
  List<Object> get props => [cartItems];
}

class ItemAddedCartEvent extends CartpEvent {
  final String product_id;
  final dynamic quantity;

  ItemAddedCartEvent({required this.product_id, this.quantity = 1});
  @override
  List<Object> get props => [];
}

class ItemDeleteCartEvent extends CartpEvent {
  final String product_id;

  ItemDeleteCartEvent({required this.product_id});
  @override
  List<Object> get props => [product_id];
}
