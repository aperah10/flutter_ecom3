import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:localstorage/localstorage.dart';
import 'package:thrid_ecom/Backend/Models/Cart/New_Cartm.dart';

/* -------------------------------------------------------------------------- */
/*           
              !     SHOW ALL PRODUCT LIST WITH TWO PATTERN :-  
              ! 1. MAKEING ANOTHER ABSTRACT CLASS :- LIKE THIS PAGE 
              ! 2. WITHOUT ANY ABSTRACT CLASS :- REGISTER, LOGIN PAGE   
                                                                                */
/* -------------------------------------------------------------------------- */
LocalStorage storage = new LocalStorage('usertoken');
var token = storage.getItem('token');

class CartDataRespo {
  Future<List<NewCart>> getCartData() async {
    String baseUrl = 'http://rahulaperah.pythonanywhere.com/cart';

    try {
      var res = await http.get(Uri.parse(baseUrl), headers: {
        "Authorization": "token $token",
      });

      if (res.statusCode == 200) {
        var datar = jsonDecode(res.body);

        MainCart mpt = MainCart.fromJson({'cartData': datar});

        List<NewCart> cartData = mpt.cartData;

        return cartData;
      } else {
        // server error
        return Future.error("Server Error !");
      }
    } catch (e) {
      print('Error:- $e');
      return Future.error("Error Fetching Data !");
    }
  }

  /* -------------------------------------------------------------------------- */
  /*                           // ! ADD TO CART Event                          */
  /* -------------------------------------------------------------------------- */

  Future<List<NewCart>> addCartData(
      {required String product_id, required int quantity}) async {
    String baseUrl = 'http://rahulaperah.pythonanywhere.com/pm/';

    try {
      var res = await http.post(Uri.parse(baseUrl),
          body: json.encode({
            "quantity": quantity,
            "product": product_id,
          }),
          headers: {
            "Content-Type": "application/json; charset=UTF-8",
            'Authorization': "token $token"
          });
      var data = json.decode(res.body) as Map;

      if (res.statusCode == 200) {
        return getCartData();
        // return true;
      }
      return Future.error("Error Fetching Data !");

      // return false;
    } catch (e) {
      print("e addtoCart");
      print(e);
      // return false;
      return Future.error("Error Fetching Data !");
    }
  }

  /* -------------------------------------------------------------------------- */
  /*                          // ! CART PRODUCT DELETE                          */
  /* -------------------------------------------------------------------------- */
  Future<List<NewCart>> delCartData({
    required String product_id,
  }) async {
    String baseUrl = 'http://rahulaperah.pythonanywhere.com/delcart/';

    try {
      var res = await http.post(Uri.parse(baseUrl),
          body: json.encode({
            'product': product_id,
          }),
          headers: {
            "Content-Type": "application/json; charset=UTF-8",
            'Authorization': "token $token"
          });
      var data = json.decode(res.body) as Map;

      if (res.statusCode == 200) {
        return getCartData();
        // return true;
      }
      return Future.error("Error Fetching Data !");

      // return false;
    } catch (e) {
      print("e addtoCart");
      print(e);
      // return false;
      return Future.error("Error Fetching Data !");
    }
  }
}
