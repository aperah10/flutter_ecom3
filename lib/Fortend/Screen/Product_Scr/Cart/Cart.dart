import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thrid_ecom/Backend/Bloc_Pattern/RCLS/Cart/cartp_bloc.dart';
import 'package:thrid_ecom/Fortend/Screen/Order/OrderwitnCart.dart';
import 'package:thrid_ecom/Fortend/Widget/Appbar/CusAppbar.dart';
import 'package:thrid_ecom/Fortend/Widget/Resuable%20Code/Form/AllFormField.dart';
import 'package:thrid_ecom/Fortend/Widget/Resuable%20Code/Form/Buttons_C.dart';
import 'package:thrid_ecom/Fortend/Widget/Resuable%20Code/Form/Text_C.dart';
import 'package:thrid_ecom/Fortend/Widget/Resuable%20Code/ListShow/ListViewP.dart';
import 'package:thrid_ecom/Fortend/Widget/Resuable%20Code/Pic_Icon/Image_C.dart';
import 'package:thrid_ecom/Fortend/Widget/Resuable%20Code/Pic_Icon/Iocns_C.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
      if (state is CartLoadingState) {
        return Center(child: CircularProgressIndicator());
      }
      if (state is CartErrorState) {
        return Center(child: Text(' this is eror ${state.message}'));
      }
      if (state is CartLoadedState) {
        return CartListViewScr(
            mainState: state.cartData, adrState: state.addressData);
      }
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    });
  }
}

class CartListViewScr extends StatefulWidget {
  dynamic mainState;
  dynamic adrState;
  dynamic adrValue;
  CartListViewScr({
    Key? key,
    this.mainState,
    this.adrState,
    this.adrValue,
  }) : super(key: key);

  @override
  _CartListViewScrState createState() => _CartListViewScrState();
}

class _CartListViewScrState extends State<CartListViewScr> {
  final _form = GlobalKey<FormState>();
  var items = ['1', '2', '3', 'more'];
  // final qtyController = TextEditingController();
  List<TextEditingController> _qtyController = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(titleName: 'Cart'),
      bottomNavigationBar: Container(
        height: 40,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              'Total Price   ',
              style: TextStyle(fontSize: 21),
            ),
            InkWell(
              onTap: () {
                // print(qtyController.text);
                // ! CHECKOUT BTN
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) =>
                //             // ! add PRODUCT ITEM DEIALS
                //             OrderWithCart(
                //                 adrState: widget.adrState,
                //                 cartState: widget.mainState)));
              },
              child: Text(
                'Place Order',
                style: TextStyle(fontSize: 21),
              ),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
          child: widget.mainState.isNotEmpty
              ? Container(
                  child: Column(
                  children: [
                    // ! Address Header
                    AddrShow(),
                    /* -------------------------------------------------------------------------- */
                    /*                           // ! PRODUCT LIST DATA                           */
                    /* -------------------------------------------------------------------------- */
                    Form(
                      key: _form,
                      child: ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: widget.mainState.length,
                          itemBuilder: (context, index) {
                            //  ! controller lsit
                            _qtyController.add(new TextEditingController());

                            return Card(
                              margin: EdgeInsets.only(
                                  top: 10.0, left: 20.0, right: 20.0),
                              color: Color(0xffEEEEEE),
                              child: Container(
                                width: double.infinity,
                                height: 150,
                                child: ListTile(
                                  leading: CartPic(
                                      widget.mainState[index].product.pic),

                                  // Lists of titles
                                  title: PrShow(),

                                  // Item Add and Remove Container
                                  subtitle: singItem(
                                      cardNumber: widget.mainState[index],
                                      index: index),
                                  trailing: Icon(Icons.delete),
                                ),
                              ),
                            );
                          }),
                    ),

                    /* -------------------------------------------------------------------------- */
                    /*                               // ! TOTAL PAGE                              */
                    /* -------------------------------------------------------------------------- */
                    TotalAmmount(),
                  ],
                ))
              : Center(child: Text('No product in Cart'))),
    );
  }

  // ! SINGLE ITEM DATA
  Widget singItem({dynamic cardNumber, required int index}) {
    return Container(
      width: 100,
      child: QuanField(
        labelText: 'Qty ${cardNumber.quantity.toString()}',
        controller: _qtyController[index],
        onData: (String? value) {
          setState(() {
            _qtyController[index].text = value!;
          });
          if (value == 'more') {
            _qtyController[index].clear();
          }
        },
        buildMethod: (BuildContext context) {
          return items.map((var value) {
            return new PopupMenuItem(
                child: new Text(value.toString()), value: value);
          }).toList();
        },
      ),
    );
  }
}

// ! Product Show Data
class PrShow extends StatelessWidget {
  const PrShow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.0),
      height: 80.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
              padding: EdgeInsets.only(bottom: 2.0),
              child: Text(
                'Title',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
              )),
          Container(
            padding: EdgeInsets.only(bottom: 3.0),
            child: Text(
              "Item Cetegory",
              style: TextStyle(),
            ),
          ),
          Container(
            padding: EdgeInsets.only(bottom: 3.0),
            child: Text(
              '50',
              style: TextStyle(color: Color(0xff374ABE)),
            ),
          ),
        ],
      ),
    );
  }
}

// ! Address CartLoadedState
class AddrShow extends StatelessWidget {
  const AddrShow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Container(
          width: double.infinity,
          height: 90,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('Name'),
              Text('fullAddress'),
              Text('Mobile Number'),
              Text('add New  or Channge Address')
            ],
          ),
        ),
      ),
    );
  }
}

// ! TOTAL ammountcount
class TotalAmmount extends StatelessWidget {
  const TotalAmmount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Container(
          width: double.infinity,
          height: 90,
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
    );
  }
}
