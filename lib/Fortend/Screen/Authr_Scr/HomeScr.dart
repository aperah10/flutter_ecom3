import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'package:thrid_ecom/Fortend/Widget/Drawer/Dras.dart';

import 'Login.dart';

class HomeScr extends StatelessWidget {
  static const routeName = '/home-scr';
  HomeScr({Key? key}) : super(key: key);

  LocalStorage storage = new LocalStorage('usertoken');

  @override
  Widget build(BuildContext context) {
    /* -------------------------------------------------------------------------- */
    /*                             // ! LOGOUT BUTTON                             */
    /* -------------------------------------------------------------------------- */

    _logoutnew() async {
      await storage.clear();
      Navigator.of(context).pushReplacementNamed(LoginScr.routeName);
    }

    return Scaffold(
      // ! DRAWER FOR HOME PAGE
      drawer: MyDrawerList(),
      // ? END DRAWER
      appBar: AppBar(
        title: Text('Home'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: _logoutnew,
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          Center(
            child: Text("Hello, home page "),
          ),
        ],
      ),
    );
  }
}
