part of 'prodwithcart_bloc.dart';

abstract class ProdwithcartEvent extends Equatable {
  ProdwithcartEvent();

  @override
  List<Object> get props => [];
}

// ! FIRST EVENT FOR FETCHING / INITIALIZE THE EVENT
class FetchProductEvent extends ProdwithcartEvent {
  @override
  List<Object> get props => [];
}

/* -------------------------------------------------------------------------- */
/*                         // ! PRODUCT ADD CART EVENT                        */
/* -------------------------------------------------------------------------- */
class ProdAddedCartEvent extends ProdwithcartEvent {
  final String product_id;
  final dynamic quantity;

  ProdAddedCartEvent({required this.product_id, this.quantity = 1});
  @override
  List<Object> get props => [];
}
