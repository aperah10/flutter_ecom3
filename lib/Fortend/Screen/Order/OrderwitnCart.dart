import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thrid_ecom/Backend/Bloc_Pattern/Order/bloc/orderpage_bloc.dart';

// ! ORDER PRODUCT_TO_JSON

class OrderWithCart extends StatefulWidget {
  dynamic cartState;
  dynamic adrState;

  OrderWithCart({Key? key, this.adrState, this.cartState}) : super(key: key);

  @override
  _OrderWithCartState createState() => _OrderWithCartState();
}

class _OrderWithCartState extends State<OrderWithCart> {
  final formKey = GlobalKey<FormState>();
  List<CartItem> cartSaved = [];

  _orderBtn() async {
    var isvalid = formKey.currentState!.validate();
    if (!isvalid) {
      return "Enter the Correct Value";
    }
    formKey.currentState!.save();

    print(cartSaved.length);

    for (var v in cartSaved) {
      BlocProvider.of<OrderpageBloc>(context)
        ..add(OrderBtn(
            address: widget.adrState[0].id,
            product: v.productId,
            quantity: v.quantity));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Demo")),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              //  ! Address Data in this is page
              Card(
                  child: Column(
                children: [
                  Text('Address'),
                  Text('${widget.adrState[0].fullname}'),
                  Text('${widget.adrState[0].phone}'),
                  Text('${widget.adrState[0].pinCode}'),
                  Text('${widget.cartState[0].product.id}'),
                  InkWell(
                    child: Text('Change or Add Address'),
                  )
                ],
              )),

              // ! Product List Data
              Form(
                key: formKey,
                child: Container(
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: widget.cartState.length,
                      itemBuilder: (context, index) {
                        if (widget.cartState.isEmpty) {
                          return CircularProgressIndicator();
                        } else {
                          return ListTile(
                            title: Card(
                              child: Column(
                                children: [
                                  Text(
                                      '${widget.cartState[index].product.title} '),
                                  Text(
                                      '${widget.cartState[index].product.description} '),
                                ],
                              ),
                            ),
                            subtitle: singleItem(widget.cartState[index]),
                          );
                        }
                      }),
                ),
              ),

              // ! btn for save data logic
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: InkWell(
                    onTap: () {
                      _orderBtn();
                      cartSaved.clear();
                    },
                    child: Text(
                      'Order',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget singleItem(dynamic cartNum) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        children: [
          TextFormField(
            keyboardType: TextInputType.number,
            initialValue: cartNum.quantity.toString(),
            onSaved: (String? val) {
              print(val);

              CartItem cartI = CartItem(
                  productId: cartNum.product.id, quantity: int.parse(val!));
              cartSaved.add(cartI);
            },
            decoration: InputDecoration(
              labelText: "Qty",
            ),
          ),
        ],
      ),
    );
  }
}

// ! only for save data logic
class CartItem {
  final String productId;
  final int quantity;

  CartItem({required this.productId, required this.quantity});
}
