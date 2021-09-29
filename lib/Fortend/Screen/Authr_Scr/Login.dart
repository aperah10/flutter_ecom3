import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:thrid_ecom/Backend/Bloc_Pattern/Authr/Login/userlogin_bloc.dart';
import 'package:thrid_ecom/Fortend/Widget/Resuable%20Code/Form/AllFormField.dart';
import 'package:thrid_ecom/Fortend/Widget/Resuable%20Code/Form/AllFormValidation.dart';
import 'package:thrid_ecom/Fortend/Widget/Resuable%20Code/Form/Buttons_C.dart';

import 'HomeScr.dart';
import 'Register.dart';

class LoginScr extends StatelessWidget {
  static const routeName = '/login-screens';
  LoginScr({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ! SCREEN PAGE
              Container(
                margin: EdgeInsets.only(top: 20.0, left: 30.0),
                child: Text(
                  "Login",
                  style: TextStyle(fontSize: 30.0),
                ),
              ),
              //  ! REGISTER PAGE

              Login1()
            ],
          ),
        ),
      ),
    );
  }
}

/* -------------------------------------------------------------------------- */
/*                      // ! LOGIN SCREEN ONE LOGIN DART                      */
/* -------------------------------------------------------------------------- */
class Login1 extends StatelessWidget {
  Login1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserloginBloc, UserloginState>(listener:
        (context, state) {
      if (state is LoginFailure) {
        Scaffold.of(context).showSnackBar(
          SnackBar(
            content: Text("Login failed."),
            backgroundColor: Colors.red,
          ),
        );
      }
      if (state is LoginSucccess) {
        Navigator.of(context).pushReplacementNamed(HomeScr.routeName);
      }
    }, child:
        BlocBuilder<UserloginBloc, UserloginState>(builder: (context, state) {
      return LoginForm(bState: state);
    }));
  }
}

/* -------------------------------------------------------------------------- */
/*                            // ! LOGIN FORM FIELD                           */
/* -------------------------------------------------------------------------- */
class LoginForm extends StatefulWidget {
  dynamic bState;
  LoginForm({Key? key, this.bState}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _form = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  /* -------------------------------------------------------------------------- */
  /*                              // ! LOGIN BUTTON                             */
  /* -------------------------------------------------------------------------- */
  _onLoginButtonPressed() async {
    var isvalid = _form.currentState!.validate();
    if (!isvalid) {
      return "Enter the Correct Value";
    }
    _form.currentState!.save();

    var isToken = BlocProvider.of<UserloginBloc>(context).add(
      LoginBtn(
        phone: usernameController.text,
        password: passwordController.text,
      ),
    );
  }

  /* -------------------------------------------------------------------------- */
  /*                             // ! END LOGIN FORM                            */
  /* -------------------------------------------------------------------------- */

  @override
  Widget build(BuildContext context) {
    /* -------------------------------------------------------------------------- */
    /*                       //  ! FORM VALIDATION PROVIDER                       */
    /* -------------------------------------------------------------------------- */
    final formvalid = Provider.of<AllFormValdation>(context);

    return Padding(
      padding: EdgeInsets.only(right: 20.0, left: 20.0, top: 80.0),
      child: Form(
        key: _form,
        child: Column(children: [
          /* -------------------------------------------------------------------------- */
          /*                                 FORM FIELD                                 */
          /* -------------------------------------------------------------------------- */
          EditFormFields(
            placeholder: 'phone',
            controller: usernameController,
            inputType: TextInputType.emailAddress,
            formValidator: (String? val) => formvalid.mobileValidator(val),
          ),
          EditFormFields(
              obscureTxt: true,
              placeholder: 'Password',
              controller: passwordController,
              inputType: TextInputType.visiblePassword,
              formValidator: (String? val) => formvalid.reqValid(val)),

          /* -------------------------------------------------------------------------- */
          /*                              FORGETEN PASSWORD                             */
          /* -------------------------------------------------------------------------- */
          Align(
            alignment: Alignment.centerRight,
            child: new InkWell(
                child: const Text(
                  "Forget password?",
                  style: TextStyle(color: Colors.black45, fontSize: 15.0),
                ),
                onTap: () {}),
          ),

          /* -------------------------------------------------------------------------- */
          /*                                SUBMIT BUTTON   Start                             */
          /* -------------------------------------------------------------------------- */

          Padding(
            padding: EdgeInsets.only(top: 30.0, bottom: 0.0),
            child: Center(
              child: widget.bState is LoginLoading
                  ? CupertinoActivityIndicator()
                  : SingleBtn(
                      'Login',
                      submitMethod: _onLoginButtonPressed,
                    ),
            ),
          ),
          /* -------------------------------------------------------------------------- */
          /*                          END  SUBMIT BUTTON                              */
          /* -------------------------------------------------------------------------- */
          ExtraBtn(btnName: 'Signup', submitMethod: RegisterScr.routeName),
        ]),
      ),
    );
  }
}
