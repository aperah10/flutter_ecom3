import 'package:flutter/material.dart';
import 'package:thrid_ecom/Fortend/Screen/Order/OrderwitnCart.dart';
import 'package:thrid_ecom/Fortend/Widget/Appbar/CusAppbar.dart';
import 'package:thrid_ecom/Fortend/Widget/Resuable%20Code/Form/AllFormField.dart';
import 'package:thrid_ecom/Fortend/Widget/Resuable%20Code/Form/Buttons_C.dart';
import 'package:thrid_ecom/Fortend/Widget/Resuable%20Code/Pic_Icon/Image_C.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ListViewScr extends StatelessWidget {
  dynamic mainState;
  dynamic adrState;
  dynamic adrValue;
  ListViewScr({
    Key? key,
    this.mainState,
    this.adrState,
    this.adrValue,
  }) : super(key: key);

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
                // ! CHECKOUT BTN
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            // ! add PRODUCT ITEM DEIALS
                            OrderWithCart(
                                adrState: adrState, cartState: mainState)));
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
          child: mainState.isNotEmpty
              ? Container(
                  child: Column(
                  children: [
                    // ! Address Header
                    Padding(
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
                    ),
                    ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: mainState.length,
                        itemBuilder: (context, index) {
                          // return ListDataScr(cartNumber: mainState[index]);
                          return ListTileScr1(
                            prodNumber: mainState[index],
                          );
                        }),

                    // ! TOTAL PAGE
                    Padding(
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
                    ),
                  ],
                ))
              : Center(child: Text('No product in Cart'))),
    );
  }
}

/* -------------------------------------------------------------------------- */
/*                           // ! ListView Tile for                           */
/* -------------------------------------------------------------------------- */

class ListTileScr1 extends StatefulWidget {
  dynamic prodNumber;

  ListTileScr1({
    Key? key,
    this.prodNumber,
  }) : super(key: key);

  @override
  _ListTileScr1State createState() => _ListTileScr1State();
}

class _ListTileScr1State extends State<ListTileScr1> {
  final _form = GlobalKey<FormState>();

  var items = ['1', '2', '3', 'more'];

  final qtyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0),
      color: Color(0xffEEEEEE),
      child: Container(
        width: double.infinity,
        height: 150,
        child: ListTile(
          onTap: () {},

          leading: CartPic(widget.prodNumber.product.pic),

          // Lists of titles
          title: Container(
            margin: EdgeInsets.only(top: 10.0),
            height: 80.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                    padding: EdgeInsets.only(bottom: 2.0),
                    child: Text(
                      'Title',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20.0),
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
          ),

          // Item Add and Remove Container
          subtitle: Container(
            width: 100,
            child: QuanField(
              labelText: 'Qty',
              controller: qtyController,
              onData: (String? value) {
                setState(() {
                  qtyController.text = value!;
                });
                if (value == 'more') {
                  qtyController.clear();
                }
              },
              buildMethod: (BuildContext context) {
                return items.map((var value) {
                  return new PopupMenuItem(
                      child: new Text(value.toString()), value: value);
                }).toList();
              },
            ),
          ),
          trailing: Icon(Icons.delete),
        ),
      ),
    );
  }
}
