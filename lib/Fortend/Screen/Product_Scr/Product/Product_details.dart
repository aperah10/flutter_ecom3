import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thrid_ecom/Backend/Bloc_Pattern/Product/ProdwithCart/prodwithcart_bloc.dart';
import 'package:thrid_ecom/Fortend/Screen/Order/OrderS.dart';
import 'package:thrid_ecom/Fortend/Screen/Product_Scr/Cart/Cart.dart';
import 'package:thrid_ecom/Fortend/Widget/Appbar/CusAppbar.dart';
import 'package:thrid_ecom/Fortend/Widget/Resuable%20Code/Form/Buttons_C.dart';
import 'package:thrid_ecom/Fortend/Widget/Resuable%20Code/Form/Text_C.dart';
import 'package:thrid_ecom/Fortend/Widget/Resuable%20Code/Pic_Icon/Image_C.dart';
import 'package:thrid_ecom/Fortend/Widget/Resuable%20Code/Stepper_DropDown/Drop_Down_C.dart';

class ProductDetailScr extends StatelessWidget {
  dynamic prodNumber;
  List? cartNumber;
  dynamic adrState;
  static final String routeName = "/product-details";
  ProductDetailScr({Key? key, this.prodNumber, this.cartNumber})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProdwithcartBloc, ProdwithcartState>(
      listener: (context, state) {},
      child: BlocBuilder<ProdwithcartBloc, ProdwithcartState>(
          builder: (context, state) {
        return Scaffold(
          appBar: CustomAppBar(
            titleName: 'Account Page',
          ),
          body: SafeArea(
              bottom: false,
              left: true,
              right: true,
              top: false,
              child: ProductDetailOne(
                prodNumber: prodNumber,
                cartNumber: cartNumber,
                adrState: adrState,
              )),
        );
      }),
    );
  }
}

class ProductDetailOne extends StatelessWidget {
  dynamic prodNumber;
  List? cartNumber;
  dynamic adrState;
  ProductDetailOne({Key? key, this.prodNumber, this.cartNumber, this.adrState})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // ! 1. PRODUCT PIC
          SinglePic(
            prodNumber.pic == null ? '' : prodNumber.pic,
          ),

          // ! 2.  TITLE
          TxtTitle('Title'),
          TxtContent(
            prodNumber.discountPrice.toString(),
          ),
          // // ! 2.1 DROPDOWN_MENU_ITEM
          TxtTitle('Varitaion'),
          // DropDownBtn(),

          // ! 3.  DESCRIPTION
          TxtTitle("Description"),
          TxtContent(
            prodNumber.description,
          ),
          TxtTitle("Description"),
          TxtContent(
            prodNumber.description,
          ),
          TxtTitle("Description"),
          TxtContent(
            prodNumber.description,
          ),
          TxtTitle("Description"),
          TxtContent(
            prodNumber.description,
          ),
          // ! 4. RATINGS , Reviews , Comments .......
          // InformationBtn(),
          // ! 5. BUTTONS FOR CART AND BUYNOW
          Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
            MultipleBtn(
                cartNumber!.any((e) => e.product!.id!
                            .contains(prodNumber.id.toString())) ==
                        false
                    ? 'Add to Cart'
                    : 'Go to Cart', submitMethod: () {
              // ! PRODUCT DOES'NT EXIST IN CART
              if (cartNumber!.any((e) =>
                      e.product!.id!.contains(prodNumber.id.toString())) ==
                  false) {
                BlocProvider.of<ProdwithcartBloc>(context)
                  ..add(ProdAddedCartEvent(
                      product_id: prodNumber.id, quantity: 1));
              } // ! PRODUCT  EXIST IN CART
              else {
                Navigator.of(context).pushReplacementNamed(CartScr.routeName);
              }
            }),
            MultipleBtn('BuyNow', submitMethod: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          // ! add PRODUCT ITEM DEIALS
                          OrderStrp(
                              prodNumber: prodNumber,
                              cartNumber: cartNumber,
                              adrNumber: adrState)));
            }),
          ])
        ],
      ),
    );
  }
}
