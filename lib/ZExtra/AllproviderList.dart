import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:thrid_ecom/Backend/Bloc_Pattern/Authr/Login/userlogin_bloc.dart';
import 'package:thrid_ecom/Backend/Bloc_Pattern/Authr/Register/register_bloc.dart';
import 'package:thrid_ecom/Backend/Bloc_Pattern/Authr/auth/userauthenticate_bloc.dart';
import 'package:thrid_ecom/Backend/Bloc_Pattern/Order/bloc/orderpage_bloc.dart';
import 'package:thrid_ecom/Backend/Bloc_Pattern/Porf_Address/Address/address_bloc.dart';
import 'package:thrid_ecom/Backend/Bloc_Pattern/Porf_Address/Profile/profile_bloc.dart';
import 'package:thrid_ecom/Backend/Bloc_Pattern/Product/ProdwithCart/prodwithcart_bloc.dart';
import 'package:thrid_ecom/Backend/Bloc_Pattern/Product/Search_Product/searchproduct_bloc.dart';
import 'package:thrid_ecom/Backend/Bloc_Pattern/RCLS/Cart/cartp_bloc.dart';
import 'package:thrid_ecom/Fortend/Widget/Resuable%20Code/Form/AllFormValidation.dart';

class MainBloc {
  static List<SingleChildWidget> allBlocs() {
    return [
      ChangeNotifierProvider(create: (ctx) => AllFormValdation()),
      BlocProvider(create: (ctx) => UserauthenticateBloc()),
      BlocProvider(create: (ctx) => RegisterBloc()),
      BlocProvider(create: (ctx) => UserloginBloc()),
      BlocProvider(create: (context) => ProdwithcartBloc()),
      BlocProvider(create: (ctx) => CartpBloc()),
      BlocProvider(create: (ctx) => SearchproductBloc()),
      BlocProvider(create: (ctx) => ProfileBloc()),
      BlocProvider(create: (ctx) => AddressBloc()),
      BlocProvider(create: (ctx) => OrderpageBloc()),
    ];
  }
}
