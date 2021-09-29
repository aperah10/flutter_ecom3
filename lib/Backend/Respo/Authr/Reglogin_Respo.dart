import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:localstorage/localstorage.dart';

class CusRLRespo {
  LocalStorage storage = new LocalStorage('usertoken');
/* -------------------------------------------------------------------------- */
/*                                this is LOGIN                               */
/* -------------------------------------------------------------------------- */
  // LOGIN PAGE
  Future<bool> loginRespo(
      {required String phone, required String password}) async {
    String baseUrl = "http://rahulaperah.pythonanywhere.com/login/";

    try {
      var res = await http.post(Uri.parse(baseUrl),
          headers: {
            "Content-Type": "application/json; charset=UTF-8",
          },
          body: json.encode({"phone": phone, "password": password}));

      var data = json.decode(res.body);

      if (res.statusCode == 200) {
        var hastoken = storage.setItem("token", data['token']);

        return true;
      }

      return false;
    } catch (e) {
      print('Error:-  $e');
      return false;
    }
  }

  // 2.   SIGNUP PAGE ========================
  Future<bool> regRespo(
      {required String email,
      required String phone,
      required String fullname,
      required String password}) async {
    String baseUrl = "http://rahulaperah.pythonanywhere.com/crusr";

    try {
      var res = await http.post(Uri.parse(baseUrl),
          headers: {
            "Content-Type": "application/json",
          },
          body: json.encode({
            "email": email,
            "fullname": fullname,
            "phone": phone,
            "password": password
          }));

      var data = json.decode(res.body) as Map;

      if (res.statusCode == 200 || data.containsKey("token")) {
        var hastoken = storage.setItem("token", data['token']);

        return true;
      }

      return false;
    } catch (e) {
      print('Error:- $e');
      return false;
    }
  }
}
