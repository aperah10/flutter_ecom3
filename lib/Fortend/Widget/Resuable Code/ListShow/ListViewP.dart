import 'package:flutter/material.dart';

class ListViewScr extends StatelessWidget {
  dynamic mainState;
  dynamic var1State;
  ListViewScr({
    Key? key,
    this.var1State,
    this.mainState,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: CustomAppBar(titleName: 'Cart'),
      body: SafeArea(
          child: mainState.isNotEmpty
              ? Container(
                  child: Column(children: <Widget>[
                  // ! LISTVIEW BUIDER
                  Flexible(
                    child: ListView.builder(
                        itemCount: mainState.length,
                        itemBuilder: (context, index) {
                          // return ListTileScr1(
                          //   prodNumber: mainState[index],
                          // );
                          return ListScr(
                            prodNumber: mainState[index],
                          );
                        }),
                  ),
                ]))
              : Center(child: const Text('No Product '))),
    );
  }
}

/* -------------------------------------------------------------------------- */
/*                           // ! ListView Tile for                           */
/* -------------------------------------------------------------------------- */

class ListTileScr1 extends StatelessWidget {
  dynamic prodNumber;
  var iconname;
  ListTileScr1({Key? key, this.prodNumber, this.iconname}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Card(
      margin: EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0),
      color: Color(0xffEEEEEE),
      child: ListTile(
        // on ListItem clicked
        onTap: () {},

        // Image of ListItem

        leading: Container(
          width: 100,
          color: Colors.red,
          height: double.infinity,
          child:
              Image.asset('images/men_t_shirt_1.jpeg', fit: BoxFit.fitHeight),
        ),

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
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
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
            child: Wrap(
          direction: Axis.horizontal,
          children: <Widget>[
            GestureDetector(
              onTap: () {},
              child: Icon(
                Icons.remove,
                size: 19.0,
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 10.0, top: 1.0, right: 10.0),
              child: Text(
                '5 quantity',
                style: TextStyle(color: Colors.black),
              ),
            ),

            // Add count button
            GestureDetector(
                onTap: () {
                  // itemCount++;
                },
                child: Icon(Icons.add)
                //  Icon(
                //   Icons.add,
                //   size: 19.0,
                // ),
                ),
          ],
        )),

        // trailing shows the widget on the right corner of the list item
        trailing: Icon(Icons.delete),
      ),
    ));
  }
}

/* -------------------------------------------------------------------------- */
/*                            // !CART LIST SCREEN                            */
/* -------------------------------------------------------------------------- */
class ListScr extends StatelessWidget {
  dynamic prodNumber;
  ListScr({Key? key, this.prodNumber}) : super(key: key);

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
                    height: 120,
                    child: Image.asset('images/men_t_shirt_1.jpeg',
                        fit: BoxFit.fitHeight)
                    // Image.network('',
                    //   // prodNumber.product.pic == null ? '' : prodNumber.product.pic,
                    //   width: 30.0,
                    //   height: 30,
                    //   fit: BoxFit.cover,
                    // ),
                    ),

                // !2. CART DATA
                Flexible(
                    child: Padding(
                        // padding: const EdgeInsets.symmetric(horizontal: 20),
                        padding: const EdgeInsets.all(15),
                        child: Column(children: <Widget>[
                          // ! 2.1
                          Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Text(
                                  'Title',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              // ! 2.1.1
                              // IconBtn(Icons.delete, submitMethod: () {
                              // ! CART ITEM DELETE
                              // BlocProvider.of<CartpBloc>(context)
                              //   ..add(ItemDeleteCartEvent(
                              //       product_id: prodNumber.product.id.toString()));
                              // BlocProvider.of<ProdwithcartBloc>(context)
                              //   ..add(ProdDeleteCartEvent(
                              //       product_id: prodNumber.product.id.toString()));
                              // ! END CART ITEM METHOD
                              // }),
                            ],
                          ),
                          // ! 2.2 data
                          Row(
                            children: [
                              Text(
                                "500 ",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "900 ",
                                style: TextStyle(
                                    fontSize: 18,
                                    decoration: TextDecoration.lineThrough),
                              )
                            ],
                          ),
                          // ! 2.3 DATA

                          // Row(
                          //   children: <Widget>[
                          //     Text("Sub Total: "),
                          //     SizedBox(
                          //       width: 5,
                          //     ),
                          //     Text(
                          //       'Rs 500*2',
                          //     )
                          //   ],
                          // ),

                          // ! 2.4 DATA

                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Icon(Icons.remove),
                              SizedBox(
                                width: 4,
                              ),
                              // ! ITEM DATA
                              Card(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text('Quantity 5'),
                                ),
                              ),
                              // ! END ITEM DATA
                              SizedBox(
                                width: 4,
                              ),
                              Icon(Icons.add),
                            ],
                          ),
                        ]))),
              ]),
            ),
            Divider(),
            // ! DELETE BUTTON FOR SAVE FOR lATER
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: InkWell(
                    child: Text(
                      'Remove ',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: InkWell(
                    child: Text(
                      'Save for Later',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
