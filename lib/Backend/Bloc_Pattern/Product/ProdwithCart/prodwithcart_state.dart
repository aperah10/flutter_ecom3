part of 'prodwithcart_bloc.dart';

abstract class ProdwithcartState extends Equatable {
  const ProdwithcartState();

  @override
  List<Object> get props => [];
}

class ProdwithcartInitial extends ProdwithcartState {}

// ! STATE ADDED FOR PRODUCT DATA $ CART DATA
class ProductCartLoadingState extends ProdwithcartState {
  @override
  List<Object> get props => [];
}

class ProductCartLoadedState extends ProdwithcartState {
  List<ProductC> productData;
  List<NewCart> cartData;
  List<Address>? addressData;

  ProductCartLoadedState({
    required this.productData,
    required this.cartData,
    this.addressData,
  });

  @override
  List<Object> get props => [];
}

class ProductCartErrorState extends ProdwithcartState {
  String message;
  ProductCartErrorState({required this.message});
  @override
  List<Object> get props => [];
}

/* -------------------------------------------------------------------------- */
/*                         // ! PRODUCT ADDED IN CART                         */
/* -------------------------------------------------------------------------- */
class ProdAddedCartState extends ProdwithcartState {
  List<NewCart> cartItems;

  ProdAddedCartState({required this.cartItems});
  @override
  List<Object> get props => [];
}
