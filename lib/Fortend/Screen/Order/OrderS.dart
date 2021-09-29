import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thrid_ecom/Backend/Bloc_Pattern/Order/bloc/orderpage_bloc.dart';
import 'package:thrid_ecom/Fortend/Screen/Authr_Scr/HomeScr.dart';
import 'package:thrid_ecom/Fortend/Screen/Prof_Address/Address/ShowAddress.dart';
import 'package:thrid_ecom/Fortend/Widget/Appbar/CusAppbar.dart';
import 'package:thrid_ecom/Fortend/Widget/Resuable%20Code/Form/Buttons_C.dart';

class OrderStrp extends StatefulWidget {
  dynamic prodNumber;
  dynamic cartNumber;
  dynamic adrNumber;

  OrderStrp({Key? key, this.cartNumber, this.prodNumber, this.adrNumber})
      : super(key: key);

  @override
  _OrderStrpState createState() => _OrderStrpState();
}

class _OrderStrpState extends State<OrderStrp> {
  dynamic adrId;
  int curStep = 0;
  dynamic ordQuan = 1;

  //  !   callback method for data
  callback(newAbc) {
    setState(() {
      adrId = newAbc;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<OrderpageBloc, OrderpageState>(listener:
        (context, state) {
      if (state is OrderFailure) {
        Scaffold.of(context).showSnackBar(
          SnackBar(
            content: Text("Order failed."),
            backgroundColor: Colors.red,
          ),
        );
      }
      if (state is OrderSucccess) {
        Navigator.of(context).pushReplacementNamed(HomeScr.routeName);
      }
    }, child:
        BlocBuilder<OrderpageBloc, OrderpageState>(builder: (context, state) {
      if (adrId == null || adrId.isEmpty) {
        adrId = widget.adrNumber[0].id;
      }

      return Scaffold(
        appBar: CustomAppBar(titleName: 'Order'),
        body: Stepper(
            type: StepperType.horizontal,
            physics: ScrollPhysics(),
            currentStep: curStep,
            // onStepCancel: () {
            //   curStep == 0 ? null : setState(() => curStep -= 1);
            // },
            // onStepContinue: () {
            //   // print(getSteps().length);
            //   final isLastStep = curStep == 3 - 1;

            //   if (isLastStep) {
            //     print('its Complete');
            //     BlocProvider.of<OrderpageBloc>(context)
            //       ..add(OrderBtn(
            //           address: adrId,
            //           product: widget.prodNumber.id,
            //           quantity: ordQuan));
            //     // print('this is addressid ${adrId}');
            //   } else {
            //     setState(() => curStep += 1);
            //   }
            // },
            controlsBuilder: (BuildContext context,
                {VoidCallback? onStepContinue, VoidCallback? onStepCancel}) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Container(
                    child: null,
                  ),
                  Container(
                    child: null,
                  ),
                ],
              );
            },
            steps: [
              Step(
                state: curStep > 0 ? StepState.complete : StepState.indexed,
                isActive: curStep >= 0,
                title: const Text('Address'),
                content: Container(
                  child: AddressShow(adrState: widget.adrNumber),
                ),
              ),
              Step(
                state: curStep > 1 ? StepState.complete : StepState.indexed,
                isActive: curStep >= 1,
                title: const Text('Order'),
                subtitle: const Text('Delivery'),
                content: Container(
                  child: Column(
                    children: [
                      Text('Quantity'),
                      // OrderProductPage(
                      //   prodNumber: widget.prodNumber,
                      // ),
                    ],
                  ),
                ),
              ),
              Step(
                state: curStep > 2 ? StepState.complete : StepState.indexed,
                isActive: curStep >= 2,
                title: const Text('Payment'),
                content: Container(
                    alignment: Alignment.centerLeft,
                    child: const Text('Content for Step 3')),
              ),
            ]),
      );
    }));
  }
}
