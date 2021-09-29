import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thrid_ecom/Backend/Bloc_Pattern/Product/ProdwithCart/prodwithcart_bloc.dart';
import 'package:thrid_ecom/Backend/Bloc_Pattern/RCLS/Cart/cartp_bloc.dart';
import 'package:thrid_ecom/Fortend/Screen/Order/OrderS.dart';
import 'package:thrid_ecom/Fortend/Screen/Product_Scr/Cart/Cart.dart';
import 'package:thrid_ecom/Fortend/Widget/Appbar/CusAppbar.dart';
import 'package:thrid_ecom/Fortend/Widget/Resuable%20Code/Form/Buttons_C.dart';
import 'package:thrid_ecom/Fortend/Widget/Resuable%20Code/Pic_Icon/Image_C.dart';

import 'Product_details.dart';

class ProductGridScr extends StatefulWidget {
  static const routeName = '/grid-product-screens';
  ProductGridScr({Key? key}) : super(key: key);

  @override
  _ProductGridScrState createState() => _ProductGridScrState();
}

class _ProductGridScrState extends State<ProductGridScr> {
//  ! PRODUCT BLOC INSTANCE
  ProdwithcartBloc prodBloc = ProdwithcartBloc();

  @override
  void initState() {
    prodBloc = BlocProvider.of<ProdwithcartBloc>(context);
    prodBloc.add(FetchProductEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProdwithcartBloc, ProdwithcartState>(
        listener: (context, state) {
      if (state is ProdAddedCartState) {
        Navigator.of(context).pushReplacementNamed(ProductGridScr.routeName);
      }
    }, builder: (context, state) {
      if (state is ProductCartLoadingState) {
        return Center(child: CircularProgressIndicator());
      }
      if (state is ProductCartErrorState) {
        Scaffold.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(
            SnackBar(
              content: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text('Login Failure'), Icon(Icons.error)],
              ),
              backgroundColor: Colors.red,
            ),
          );
      }
      if (state is ProductCartLoadedState) {
        return ProdScr1(
          cartState: state.cartData,
          prodState: state.productData,
          adrState: state.addressData,
        );
      }
      return Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    });
  }
}

/* -------------------------------------------------------------------------- */
/*                        // ! EXTRA CLASS FOR PRODUCT                        */
/* -------------------------------------------------------------------------- */
class ProdScr1 extends StatelessWidget {
  dynamic cartState;
  dynamic prodState;
  dynamic adrState;
  ProdScr1({Key? key, this.prodState, this.cartState, this.adrState})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(titleName: 'ProductPage'),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.orange,
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => BlocProvider.value(
                        value: BlocProvider.of<ProdwithcartBloc>(context),
                        child: CartScr())));
          },
          child: Text(
            cartState.length.toString(),
          ),
        ),
        body: SafeArea(
          bottom: false,
          left: true,
          right: true,
          top: false,
          child: ProdGridList(
            prodState: prodState,
            cartState: cartState,
            adrState: adrState,
          ),
        ));
  }
}

/* -------------------------------------------------------------------------- */
/*                           // ! PRODUCT GRID  LIST                          */
/* -------------------------------------------------------------------------- */
class ProdGridList extends StatelessWidget {
  dynamic cartState;
  dynamic prodState;
  dynamic adrState;
  ProdGridList({Key? key, this.prodState, this.cartState, this.adrState})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.builder(
          shrinkWrap: true,
          itemCount: prodState.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.80,
          ),
          // padding: EdgeInsets.symmetric(horizontal: 20.0),
          itemBuilder: (context, index) {
            return ProdGridListShow(
                prodNumber: prodState[index],
                cartNumber: cartState,
                adrNumber: adrState);
          }),
    );
  }
}

/* -------------------------------------------------------------------------- */
/*                         // ! PRODUCT GRID LIST SHOW                        */
/* -------------------------------------------------------------------------- */
class ProdGridListShow extends StatelessWidget {
  dynamic prodNumber;
  List? cartNumber;
  dynamic adrNumber;
  ProdGridListShow({Key? key, this.prodNumber, this.cartNumber, this.adrNumber})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: SizedBox(
        width: 150.0,
        child: Wrap(
          children: <Widget>[
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            // ! add PRODUCT ITEM DEIALS
                            ProductDetailScr(
                                prodNumber: prodNumber,
                                cartNumber: cartNumber)));
              },
              child: Card(
                child: Column(
                  children: [
                    // ! PRODUCT PI
                    MultiplePic(prodNumber.pic == null ? '' : prodNumber.pic),
                    // ! END PRODUCT PIC
                    ListTile(
                      title: Text(
                        prodNumber.title,
                        // title,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        prodNumber.description,
                        // subTitle,
                        style: TextStyle(fontSize: 12.0),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ForthBtn(
                  cartNumber!.any((e) => e.product!.id!
                              .contains(prodNumber.id.toString())) ==
                          false
                      ? 'acart'
                      : 'gcart',
                  submitMethod: () {
                    // ! PRODUCT DOES'NT EXIST IN CART
                    if (cartNumber!.any((e) => e.product!.id!
                            .contains(prodNumber.id.toString())) ==
                        false) {
                      BlocProvider.of<CartpBloc>(context)
                        ..add(ItemAddedCartEvent(
                            product_id: prodNumber.id, quantity: 1));
                    } // ! PRODUCT  EXIST IN CART
                    else {
                      Navigator.of(context)
                          .pushReplacementNamed(CartScr.routeName);
                    }
                  },
                ),
                ForthBtn('Buy', submitMethod: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              // ! add PRODUCT ITEM DEIALS
                              OrderStrp(
                                  prodNumber: prodNumber,
                                  cartNumber: cartNumber,
                                  adrNumber: adrNumber)));
                })
              ],
            )
          ],
        ),
      ),
    );
  }
}
