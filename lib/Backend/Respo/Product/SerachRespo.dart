import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:thrid_ecom/Backend/Models/Product/New_Product_m.dart';

/* -------------------------------------------------------------------------- */
/*           
              !     SHOW ALL PRODUCT LIST WITH TWO PATTERN :-  
              ! 1. MAKEING ANOTHER ABSTRACT CLASS :- LIKE THIS PAGE 
              ! 2. WITHOUT ANY ABSTRACT CLASS :- REGISTER, LOGIN PAGE   
                                                                                */
/* -------------------------------------------------------------------------- */

class SearchPDataRespo {
  Future<List<ProductC>> getSearchP(String query) async {
    String baseUrl =
        'http://rahulaperah.pythonanywhere.com/search/?search=$query';
    try {
      var res = await http.get(Uri.parse(baseUrl));

      if (res.statusCode == 200) {
        var datar = jsonDecode(res.body);

        MainProduct mpt = MainProduct.fromJson({'productData': datar});

        List<ProductC> productData = mpt.productData;

        return productData;
      } else {
        // server error
        return Future.error("Server Error !");
      }
    } catch (e) {
      print('Error:- $e');
      return Future.error("Error Fetching Data !");
    }
  }
}
