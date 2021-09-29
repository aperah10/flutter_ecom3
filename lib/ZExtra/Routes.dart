import 'package:flutter/material.dart';
import 'package:thrid_ecom/Fortend/Screen/Authr_Scr/HomeScr.dart';
import 'package:thrid_ecom/Fortend/Screen/Authr_Scr/Login.dart';
import 'package:thrid_ecom/Fortend/Screen/Authr_Scr/Register.dart';
import 'package:thrid_ecom/Fortend/Screen/Product_Scr/Cart/Cart.dart';
import 'package:thrid_ecom/Fortend/Screen/Product_Scr/Product/Product_Cat.dart';
import 'package:thrid_ecom/Fortend/Screen/Prof_Address/Address/AddAddress.dart';
import 'package:thrid_ecom/Fortend/Screen/Prof_Address/Address/ShowAddress.dart';
import 'package:thrid_ecom/Fortend/Screen/Prof_Address/Address/UpAddress.dart';
import 'package:thrid_ecom/Fortend/Screen/Prof_Address/Profile/EditProfile.dart';
import 'package:thrid_ecom/Fortend/Screen/Prof_Address/Profile/ShowProfile.dart';

final Map<String, WidgetBuilder> routes = {
  HomeScr.routeName: (ctx) => HomeScr(),
  LoginScr.routeName: (ctx) => LoginScr(),
  RegisterScr.routeName: (ctx) => RegisterScr(),
  ProductGridScr.routeName: (ctx) => ProductGridScr(),
  CartScr.routeName: (ctx) => CartScr(),
  ProfileShowScr.routeName: (ctx) => ProfileShowScr(),
  AddressShowScr.routeName: (ctx) => AddressShowScr(),
  AddressPostScr.routeName: (ctx) => AddressPostScr(),
  ProfileEditScr.routeName: (ctx) => ProfileEditScr(),
  AddressUpScr.routeName: (ctx) => AddressUpScr(),
};
