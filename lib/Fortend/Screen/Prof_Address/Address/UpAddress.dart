import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:thrid_ecom/Backend/Bloc_Pattern/Porf_Address/Address/address_bloc.dart';
import 'package:thrid_ecom/Fortend/Widget/Resuable%20Code/Form/AllFormField.dart';
import 'package:thrid_ecom/Fortend/Widget/Resuable%20Code/Form/AllFormValidation.dart';
import 'package:thrid_ecom/Fortend/Widget/Resuable%20Code/Form/Buttons_C.dart';
import 'package:thrid_ecom/Fortend/Widget/Resuable%20Code/Stepper_DropDown/Drop_Down_C.dart';
import 'package:thrid_ecom/ZExtra/DataList.dart';

import 'ShowAddress.dart';

class AddressUpScr extends StatelessWidget {
  static const routeName = '/up-address121-post';
  dynamic adrState;
  dynamic adrNumber;
  AddressUpScr({Key? key, this.adrNumber, this.adrState}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: BlocListener<AddressBloc, AddressState>(
        listener: (context, state) {
          if (state is AddressLoadingState) {
            Center(child: CircularProgressIndicator());
          }
          if (state is AddressErrorState) {
            Center(child: Text(state.error.toString()));
          }
          if (state is AddressSuccessState) {
            Navigator.of(context)
                .pushReplacementNamed(AddressShowScr.routeName);
          }
        },
        child:
            BlocBuilder<AddressBloc, AddressState>(builder: (context, state) {
          return UpAddressScreen(adrState: adrState, adrNumber: adrNumber);
        }),
      ),
    ));
  }
}

// /* -------------------------------------------------------------------------- */
// /*                                 // !  LOGIC                                */
// /* -------------------------------------------------------------------------- */

class UpAddressScreen extends StatefulWidget {
  dynamic adrNumber;
  dynamic adrState;
  UpAddressScreen({Key? key, this.adrNumber, this.adrState}) : super(key: key);
  @override
  _UpAddressScreenState createState() => _UpAddressScreenState();
}

class _UpAddressScreenState extends State<UpAddressScreen> {
  final _form = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final houseController = TextEditingController();
  final tradeController = TextEditingController();
  final areaController = TextEditingController();
  final cityController = TextEditingController();
  final pinCodeController = TextEditingController();
  final stateController = TextEditingController();
  final delTimeController = TextEditingController();

  /* -------------------------------------------------------------------------- */
  /*                              // ! Address BUTTON                             */
  /* -------------------------------------------------------------------------- */
  _upaddressBtn() async {
    var isvalid = _form.currentState!.validate();
    if (!isvalid) {
      return "Enter the Correct Value";
    }
    _form.currentState!.save();

    var isToken = BlocProvider.of<AddressBloc>(context).add(
      AddressUpBtnEvent(
        id: widget.adrNumber.id,
        fullname: nameController.text.isNotEmpty || nameController.text != null
            ? nameController.text
            : widget.adrNumber.fullname,
        email: emailController.text.isNotEmpty || emailController.text != null
            ? emailController.text
            : widget.adrNumber.email,
        phone: phoneController.text.isNotEmpty || phoneController.text != null
            ? phoneController.text
            : widget.adrNumber.phone,
        house: houseController.text.isNotEmpty || houseController.text != null
            ? houseController.text
            : widget.adrNumber.house,
        trade: tradeController.text.isNotEmpty || tradeController.text != null
            ? tradeController.text
            : widget.adrNumber.trade,
        city: cityController.text.isNotEmpty || cityController.text != null
            ? cityController.text
            : widget.adrNumber.city,
        area: areaController.text.isNotEmpty || areaController.text != null
            ? areaController.text
            : widget.adrNumber.area,
        pinCode:
            pinCodeController.text.isNotEmpty || pinCodeController.text != null
                ? pinCodeController.text
                : widget.adrNumber.pinCode,
        state: stateController.text.isNotEmpty
            ? stateController.text
            : widget.adrNumber.state,
        delTime: delTimeController.text.isNotEmpty
            ? delTimeController.text
            : widget.adrNumber.delTime,
      ),
    );
  }

  /* -------------------------------------------------------------------------- */
  /*                             // ! END Address BUTTON FORM                            */
  /* -------------------------------------------------------------------------- */

  @override
  Widget build(BuildContext context) {
    /* -------------------------------------------------------------------------- */
    /*                       //  ! FORM VALIDATION PROVIDER                       */
    /* -------------------------------------------------------------------------- */
    final formvalid = Provider.of<AllFormValdation>(context);

    return SingleChildScrollView(
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _form,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // ! Name EditFormFields
                EditFormFields(
                  formValidator: (String? val) => formvalid.reqValid(val),
                  initValue: widget.adrNumber.fullname.toString().isNotEmpty
                      ? widget.adrNumber.fullname
                      : '',
                  placeholder: 'Name',
                  inputType: TextInputType.name,
                  savedValue: (String? newValue) {
                    // ! DROP DOWN MENU  dropdownValue
                    setState(() {
                      nameController.text = newValue!;
                    });
                  },
                ),
                // ! PHONE field
                EditFormFields(
                  formValidator: (String? val) =>
                      formvalid.mobileValidator(val),
                  initValue: widget.adrNumber.phone.toString().isNotEmpty
                      ? widget.adrNumber.phone
                      : '',
                  placeholder: 'Phone',
                  inputType: TextInputType.phone,
                  savedValue: (String? newValue) {
                    // ! DROP DOWN MENU  dropdownValue
                    setState(() {
                      phoneController.text = newValue!;
                    });
                  },
                ),

                // ! Email field
                EditFormFields(
                  formValidator: (String? val) => formvalid.emailVal2(val),
                  placeholder: 'Email',
                  inputType: TextInputType.emailAddress,
                  initValue: widget.adrNumber.email.toString().isNotEmpty
                      ? widget.adrNumber.email
                      : '',
                  savedValue: (String? newValue) {
                    // ! DROP DOWN MENU  dropdownValue
                    setState(() {
                      emailController.text = newValue!;
                    });
                  },
                ),

                // ! House field
                EditFormFields(
                  placeholder: 'house',
                  inputType: TextInputType.name,
                  initValue: widget.adrNumber.house.toString().isNotEmpty
                      ? widget.adrNumber.house
                      : '',
                  savedValue: (String? newValue) {
                    // ! DROP DOWN MENU  dropdownValue
                    setState(() {
                      houseController.text = newValue!;
                    });
                  },
                ),
                // ! Address field
                EditFormFields(
                  placeholder: 'Trade',
                  inputType: TextInputType.name,
                  initValue: widget.adrNumber.trade.toString().isNotEmpty
                      ? widget.adrNumber.trade
                      : '',
                  savedValue: (String? newValue) {
                    // ! DROP DOWN MENU  dropdownValue
                    setState(() {
                      tradeController.text = newValue!;
                    });
                  },
                ),

                // ! City field
                EditFormFields(
                  formValidator: (String? val) => formvalid.reqValid(val),
                  inputType: TextInputType.name,
                  placeholder: 'City',
                  initValue: widget.adrNumber.city.toString().isNotEmpty
                      ? widget.adrNumber.city
                      : '',
                  savedValue: (String? newValue) {
                    // ! DROP DOWN MENU  dropdownValue
                    setState(() {
                      cityController.text = newValue!;
                    });
                  },
                ),

                // ! City field
                EditFormFields(
                  inputType: TextInputType.name,
                  placeholder: 'Area',
                  initValue: widget.adrNumber.area.toString().isNotEmpty
                      ? widget.adrNumber.area
                      : '',
                  savedValue: (String? newValue) {
                    // ! DROP DOWN MENU  dropdownValue
                    setState(() {
                      areaController.text = newValue!;
                    });
                  },
                ),

                // ! POSTTAL field
                EditFormFields(
                  formValidator: (String? val) =>
                      formvalid.postalCodeValid(val),
                  inputType: TextInputType.number,
                  placeholder: 'PostalCode',
                  initValue: widget.adrNumber.pinCode.toString().isNotEmpty
                      ? widget.adrNumber.pinCode
                      : '',
                  savedValue: (String? newValue) {
                    // ! DROP DOWN MENU  dropdownValue
                    setState(() {
                      pinCodeController.text = newValue!;
                    });
                  },
                ),

                // ! DROP DOWN FOR STATE_LIST
                DropDownBtn(
                  formValidator: (String? val) => formvalid.reqValid(val),
                  pageName: 'State',
                  dName: widget.adrNumber.state.toString().isNotEmpty
                      ? widget.adrNumber.state
                      : 'State',
                  listData: AllListData.stateData,
                  listController: stateController,
                  currentItem: widget.adrNumber.state.toString().isNotEmpty
                      ? widget.adrNumber.state
                      : null,
                ),

                // ! DELIVEY TIME
                DropDownBtn(
                  dName: widget.adrNumber.delTime.toString().isNotEmpty
                      ? widget.adrNumber.delTime
                      : 'Delivery Time',
                  pageName: 'Delivery Time',
                  listData: AllListData.deliveryData,
                  listController: delTimeController,
                  currentItem: widget.adrNumber.delTime.toString().isNotEmpty
                      ? widget.adrNumber.delTime
                      : null,
                ),

                // Login Button
                Padding(
                  padding: EdgeInsets.only(top: 30.0, bottom: 0.0),
                  child: widget.adrState is AddressLoadingState
                      ? CupertinoActivityIndicator()
                      : SingleBtn(
                          'Save',
                          submitMethod: _upaddressBtn,
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
