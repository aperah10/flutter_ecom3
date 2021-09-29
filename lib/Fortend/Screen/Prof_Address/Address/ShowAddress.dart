import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thrid_ecom/Backend/Bloc_Pattern/Porf_Address/Address/address_bloc.dart';
import 'package:thrid_ecom/Fortend/Widget/Appbar/CusAppbar.dart';
import 'package:thrid_ecom/Fortend/Widget/Resuable%20Code/Form/Buttons_C.dart';
import 'package:thrid_ecom/Fortend/Widget/Resuable%20Code/Pic_Icon/Iocns_C.dart';

import 'AddAddress.dart';
import 'UpAddress.dart';

class AddressShowScr extends StatelessWidget {
  static const routeName = '/showp-Addresspage in ';
  AddressShowScr({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(titleName: 'Address Page '),
      body: SafeArea(
        bottom: false,
        left: true,
        right: true,
        top: false,
        child: Address1(),
      ),
    );
  }
}

/* -------------------------------------------------------------------------- */
/*                              // ! Address BODY                             */
/* -------------------------------------------------------------------------- */
class Address1 extends StatefulWidget {
  Address1({
    Key? key,
  }) : super(key: key);

  @override
  _Address1State createState() => _Address1State();
}

class _Address1State extends State<Address1> {
  dynamic idtData;

  // ! Address instance

  AddressBloc prodBloc = AddressBloc();

  @override
  void initState() {
    prodBloc = BlocProvider.of<AddressBloc>(context);
    prodBloc.add(FetchAddressEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddressBloc, AddressState>(
      listener: (context, state) {},
      child: BlocBuilder<AddressBloc, AddressState>(builder: (context, state) {
        if (state is AddressLoadedState) {
          return AddressShow(
            adrState: state.addressData,
          );
        }
        if (state is AddressErrorState) {
          Center(child: Text(state.error.toString()));
        }

        return Center(child: CircularProgressIndicator());
      }),
    );
  }
}

/* -------------------------------------------------------------------------- */
/*                              // ! ADDRESS SHOW                             */
// /* -------------------------------------------------------------------------- */

class AddressShow extends StatefulWidget {
  dynamic adrState;

  AddressShow({
    Key? key,
    this.adrState,
  }) : super(key: key);

  @override
  _AddressShowState createState() => _AddressShowState();
}

class _AddressShowState extends State<AddressShow> {
  dynamic gValue = 0;
  dynamic idt;

  @override
  void initState() {
    idt = widget.adrState[0].id;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ! Address Header
        Card(
          child: Container(
            width: double.infinity,
            height: 30,
            child: ListTile(
              onTap: () {},
              leading: const Icon(Icons.add),
              title: Text(
                'Add New Address',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
        ),

        // ! Conatiner for listview builder
        widget.adrState.isNotEmpty
            ? Container(
                child: Column(
                  children: [
                    ListView.builder(
                        shrinkWrap: true,
                        itemCount: widget.adrState.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Card(
                              child: RadioListTile(
                                value: index,
                                groupValue: gValue,
                                onChanged: (ind) {
                                  setState(() {
                                    gValue = ind;
                                    idt = widget.adrState[index].id;
                                  });
                                },
                                title: AddressDataM(
                                    adrNumber: widget.adrState[index]),
                              ),
                            ),
                          );
                        }),

                    // // ! Submit Button
                    SingleBtn(
                      'Delivery Here',
                      submitMethod: () {
                        print(idt);
                      },
                    )
                  ],
                ),
              )
            : Center(
                child: Text('No Address'),
              )

        // // ! Address field DATA
      ],
    ));
  }
}

class AddressDataM extends StatelessWidget {
  dynamic adrNumber;

  AddressDataM({Key? key, this.adrNumber}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ! fullname
        Text(
          adrNumber.fullname != null ? adrNumber.fullname : 'Fullname',
          // title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(adrNumber.phone != null ? adrNumber.phone : 'Phone'),
        Text(adrNumber.house != null ? adrNumber.house : 'house number'),
        Text(adrNumber.trade != null ? adrNumber.trade : 'Trade'),
        Text(adrNumber.city != null ? adrNumber.city : 'City'),
        Text(adrNumber.pinCode != null ? adrNumber.pinCode : 'PostalCode'),
        Text(adrNumber.state != null ? adrNumber.state : 'State'),
        Text(adrNumber.delTime != null ? adrNumber.delTime : 'DelTime'),
      ],
    ));
  }
}

/* -------------------------------------------------------------------------- */
/*                         // ! ADDRESS GRID LIST VIEW                        */
/* -------------------------------------------------------------------------- */
class AddressGridListShow extends StatelessWidget {
  dynamic adrNumber;
  dynamic adrState;

  AddressGridListShow({
    Key? key,
    this.adrNumber,
    this.adrState,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.all(10.0),
      child: SizedBox(
        width: 20.0,
        child: Wrap(
          children: <Widget>[
            // ! END PRODUCT PIC
            ListTile(
                onTap: () {},
                trailing: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    // ! ADDRESS UPDATE Screen
                                    AddressUpScr(
                                      adrNumber: adrNumber,
                                      adrState: adrState,
                                    )));
                      },
                      child: Text(
                        'Edit Address',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),

                    // ! REMOVE ICON listvie builder
                    // ! 2.1.1
                    IconBtn(Icons.delete, submitMethod: () {
                      // // ! CART ITEM DELETE
                      //                       BlocProvider.of<ProdwithcartBloc>(
                      //                           context)
                      //                         ..add(ProdDeleteCartEvent(
                      //                             product_id: state
                      //                                 .productData[0].id
                      //                                 .toString()));
                      //                       // ! END CART ITEM METHOD
                    }),
                  ],
                ),
                title: Text(
                  adrNumber.fullname,
                  // title,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Container(
                  height: 100,
                  color: Colors.deepOrange,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(adrNumber.phone),
                        Text(adrNumber.house != null
                            ? adrNumber.house
                            : 'house number'),
                        Text(adrNumber.trade != null
                            ? adrNumber.trade
                            : 'Trade'),
                        Text(adrNumber.city != null ? adrNumber.city : 'City'),
                        Text(adrNumber.state != null
                            ? adrNumber.state
                            : 'State'),
                        Text(adrNumber.delTime != null
                            ? adrNumber.delTime
                            : 'DelTime'),
                      ]),
                )),
          ],
        ),
      ),
    );
  }
}
