import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thrid_ecom/Backend/Bloc_Pattern/RCLS/Cart/cartp_bloc.dart';
import 'package:thrid_ecom/Fortend/Screen/Order/OrderwitnCart.dart';
import 'package:thrid_ecom/Fortend/Widget/Appbar/CusAppbar.dart';
import 'package:thrid_ecom/Fortend/Widget/Resuable%20Code/Form/Buttons_C.dart';
import 'package:thrid_ecom/Fortend/Widget/Resuable%20Code/Form/Text_C.dart';
import 'package:thrid_ecom/Fortend/Widget/Resuable%20Code/Pic_Icon/Iocns_C.dart';

class CartScr extends StatefulWidget {
  static const routeName = '/cart-screens';
  CartScr({Key? key}) : super(key: key);

  @override
  _CartScrState createState() => _CartScrState();
}

class _CartScrState extends State<CartScr> {
  CartpBloc cartBloc = CartpBloc();

  // ! LOAD INIT STATE IS CART PAGE
  @override
  void initState() {
    cartBloc = BlocProvider.of<CartpBloc>(context);
    cartBloc.add(FetchCartEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartpBloc, CartpState>(listener: (context, state) {
      if (state is ItemDeletingCartState) {
        Navigator.of(context).pushReplacementNamed(CartScr.routeName);
      }
    }, builder: (context, state) {
      // print("produc page state: $state");
      if (state is CartLoadingState) {
        return Center(child: CircularProgressIndicator());
      }
      if (state is CartErrorState) {
        return Center(child: Text(' this is eror ${state.message}'));
      }
      if (state is CartLoadedState) {
        return CartScr1(cartState: state.cartData, adrState: state.addressData);
      }
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    });
  }
}

/* -------------------------------------------------------------------------- */
/*                              // ! CART SCREEN                              */
/* -------------------------------------------------------------------------- */

class CartScr1 extends StatelessWidget {
  dynamic cartState;
  dynamic adrState;
  dynamic adrValue;
  CartScr1({
    Key? key,
    this.cartState,
    this.adrState,
    this.adrValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(titleName: 'Cart'),
      bottomNavigationBar: Row(
        children: [Text('Total Price '), Text('Place Order')],
      ),
      body: SafeArea(
          child: cartState.isNotEmpty
              ? Container(
                  child: Column(children: <Widget>[
                  // ! Address Header
                  Card(
                    child: Container(
                      width: double.infinity,
                      height: 30,
                      child: ListTile(
                        onTap: () {},
                        title: Column(
                          children: [
                            Text(
                              'name',
                              style: TextStyle(fontSize: 15),
                            ),
                            Text(
                              'fullAddress',
                              style: TextStyle(fontSize: 12),
                            ),
                            Text(
                              'mobileNumber',
                              style: TextStyle(fontSize: 15),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  // ! LISTVIEW BUIDER
                  Flexible(
                    child: ListView.builder(
                        itemCount: cartState.length,
                        itemBuilder: (context, index) {
                          return CartListScr(cartNumber: cartState[index]);
                        }),
                  ),
                  // // ! CHECKOUT BTN
                  // CartCheckBtn(adrState: adrState, cartState: cartState)
                ]))
              : Center(child: Text('No product in Cart'))),
    );
  }
}

/* -------------------------------------------------------------------------- */
/*                            // ! CHECKOUT SCREEN                            */
/* -------------------------------------------------------------------------- */
class CartCheckBtn extends StatelessWidget {
  dynamic adrState;
  dynamic cartState;
  CartCheckBtn({Key? key, this.adrState, this.cartState}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.black12,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              // ! TOATAL PRICE DATA
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: <Widget>[
                    TxtTitle(
                      "Checkout Price:",
                    ),
                    Spacer(),
                    Text(
                      "Rs. 5000",
                    ),
                  ],
                ),
              ),
              //  ! 2
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: <Widget>[
                    TxtTitle(
                      "Checkout Price:",
                    ),
                    Spacer(),
                    Text(
                      "Rs. 5000",
                    ),
                  ],
                ),
              ),

              // ! CHECKOUT BTN
              SingleBtn(
                "Continue",
                submitMethod: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              // ! add PRODUCT ITEM DEIALS
                              OrderWithCart(
                                  adrState: adrState, cartState: cartState)));
                },
              )
            ]));
  }
}

/* -------------------------------------------------------------------------- */
/*                            // !CART LIST SCREEN                            */
/* -------------------------------------------------------------------------- */
class CartListScr extends StatelessWidget {
  dynamic cartNumber;
  CartListScr({Key? key, this.cartNumber}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 180,
        width: double.infinity,
        child: Column(
          children: [
            Card(
              child: Row(children: <Widget>[
                // ! 1  Product PIC

                Container(
                  width: 100,
                  height: 100,
                  child: Image.network(
                    cartNumber.product.pic == null
                        ? ''
                        : cartNumber.product.pic,
                    width: 30.0,
                    height: 30,
                    fit: BoxFit.cover,
                  ),
                ),

                // !2. CART DATA
                Flexible(
                    child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Column(children: <Widget>[
                          // ! 2.1
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: TxtTitle(cartNumber.product.title),
                              ),
                            ],
                          ),
                          // ! 2.2 data
                          Row(
                            children: [
                              TxtTitle("Price: "),
                              SizedBox(
                                width: 5,
                              ),
                              SubTxtTitle(
                                cartNumber.product.discountPrice.toString(),
                              )
                            ],
                          ),
                          // ! 2.3 DATA

                          // Row(
                          //   children: <Widget>[
                          //     TxtTitle("Sub Total: "),
                          //     SizedBox(
                          //       width: 5,
                          //     ),
                          //     SubTxtTitle(
                          //       'Rs ${cartNumber.quantity * cartNumber.product.discountPrice}',
                          //     )
                          //   ],
                          // ),

                          // ! 2.4 DATA

                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              IconBtn2(icon: Icons.remove),
                              SizedBox(
                                width: 4,
                              ),
                              // ! ITEM DATA
                              Card(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(cartNumber.quantity.toString()),
                                ),
                              ),
                              // ! END ITEM DATA
                              SizedBox(
                                width: 4,
                              ),
                              IconBtn2(icon: Icons.add),
                            ],
                          )
                        ])))
              ]),
            ),

            Divider(),
            // ! DELETE BUTTON FOR SAVE FOR lATER
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                ForthBtn(
                  'Remove',
                  submitMethod: () {
                    // ! CART ITEM DELETE
                    BlocProvider.of<CartpBloc>(context)
                      ..add(ItemDeleteCartEvent(
                          product_id: cartNumber.product.id.toString()));

                    // ! END CART ITEM METHOD
                  },
                ),
                ForthBtn(
                  'Save For Later',
                  submitMethod: () {},
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
