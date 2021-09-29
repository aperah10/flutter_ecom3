import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:thrid_ecom/Backend/Models/Cart/New_Cartm.dart';
import 'package:thrid_ecom/Backend/Models/Prof_Address/Addressm.dart';
import 'package:thrid_ecom/Backend/Respo/Prof_Address/AddressRespo.dart';
import 'package:thrid_ecom/Backend/Respo/RCLS/Cart/CartRespo.dart';

part 'cartp_event.dart';
part 'cartp_state.dart';

class CartpBloc extends Bloc<CartpEvent, CartpState> {
  // ! Adding Repo for data logic
  CartDataRespo cartRespo = CartDataRespo();
  AddressDataRespo addRespo = AddressDataRespo();

  CartpBloc() : super(CartpInitial());

  @override
  Stream<CartpState> mapEventToState(
    CartpEvent event,
  ) async* {
    if (event is FetchCartEvent) {
      yield CartLoadingState();
      try {
        List<Address> addressData = await addRespo.getAddressData();
        List<NewCart> cartData = await cartRespo.getCartData();

        yield CartLoadedState(cartData: cartData, addressData: addressData);
      } catch (e) {
        yield CartErrorState(message: e.toString());
      }
    }

    /* -------------------------------------------------------------------------- */
    /*                  // ! CART ADDED , ADDING  , DELETING BLOC                 */
    /* -------------------------------------------------------------------------- */
    if (event is ItemAddingCartEvent) {
      yield ItemAddingCartState(cartItems: event.cartItems);
    }

    if (event is ItemAddedCartEvent) {
      List<NewCart> prodList = await cartRespo.addCartData(
          product_id: event.product_id, quantity: event.quantity);

      yield ItemAddedCartState(cartItems: prodList);
    }

    /* -------------------------------------------------------------------------- */
    /*                           // ! CART ITEM DELTING                           */
    /* -------------------------------------------------------------------------- */
    if (event is ItemDeleteCartEvent) {
      List<NewCart> prodList = await cartRespo.delCartData(
        product_id: event.product_id,
      );

      yield ItemDeletingCartState(cartItems: prodList);
    }
  }
}
