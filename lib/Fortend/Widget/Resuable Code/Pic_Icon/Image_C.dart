import 'package:flutter/material.dart';

/* -------------------------------------------------------------------------- */
/*                          // ! PRODUCT DETAILS PIC                          */
/* -------------------------------------------------------------------------- */
class SinglePic extends StatelessWidget {
  dynamic prodPic;
  SinglePic(this.prodPic, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      // margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
      elevation: 5.0,
      child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Center(
            child: Image.network(
              prodPic,
              fit: BoxFit.cover,
            ),
          )),
    );
  }
}

/* -------------------------------------------------------------------------- */
/*                                // ! CART PIC                               */
/* -------------------------------------------------------------------------- */
class CartPic extends StatelessWidget {
  dynamic cartPic;
  CartPic(this.cartPic, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      decoration: BoxDecoration(
          image: DecorationImage(
        image: NetworkImage(cartPic == null ? '' : cartPic),
        fit: BoxFit.cover,
      )),
    );
  }
}

// !PRODUCT CATEGROY PIC
class MultiplePic extends StatelessWidget {
  dynamic prodPic;
  MultiplePic(
    this.prodPic, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 150,
      child: Image.network(
        prodPic,
        width: 30.0,
        height: 30,
        fit: BoxFit.cover,
      ),
    );
  }
}
