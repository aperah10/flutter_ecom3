import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:thrid_ecom/Backend/Bloc_Pattern/Authr/Register/register_bloc.dart';
import 'package:thrid_ecom/Fortend/Widget/Resuable%20Code/Form/AllFormField.dart';
import 'package:thrid_ecom/Fortend/Widget/Resuable%20Code/Form/AllFormValidation.dart';
import 'package:thrid_ecom/Fortend/Widget/Resuable%20Code/Form/Buttons_C.dart';

import 'HomeScr.dart';
import 'Login.dart';

class RegisterScr extends StatelessWidget {
  static const routeName = '/signup-screens';
  RegisterScr({Key? key}) : super(key: key);

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
                  "SignUp",
                  style: TextStyle(fontSize: 30.0),
                ),
              ),
              //  ! REGISTER PAGE
              // SignUpForm()
              Register1()
            ],
          ),
        ),
      ),
    );
  }
}

/* -------------------------------------------------------------------------- */
/*                          // ! REGISTER PAGE LOGIC                          */
/* -------------------------------------------------------------------------- */
class Register1 extends StatelessWidget {
  Register1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterBloc, RegisterState>(
        listener: (context, state) {
      if (state is RegisterFailed) {
        Scaffold.of(context).showSnackBar(
          SnackBar(
            content: const Text("Register failed."),
            backgroundColor: Colors.red,
          ),
        );
      }
      if (state is RegisterSucced) {
        Navigator.of(context).pushReplacementNamed(HomeScr.routeName);
      }
    }, child:
            BlocBuilder<RegisterBloc, RegisterState>(builder: (context, state) {
      return SignUpForm(bState: state);
    }));
  }
}

/* -------------------------------------------------------------------------- */
/*                     // ! 2. SIGNUP FORM WITHOUT BLOC LOGIC                    */
/* -------------------------------------------------------------------------- */
class SignUpForm extends StatefulWidget {
  dynamic bState;
  SignUpForm({Key? key, this.bState}) : super(key: key);

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _form = GlobalKey<FormState>();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final fullnameController = TextEditingController();
  final emailController = TextEditingController();

  /* -------------------------------------------------------------------------- */
  /*                      //  !SUBMIT MEHTOD FOR VALIDATION                     */
  /* -------------------------------------------------------------------------- */

  _registerNow() async {
    var isvalid = _form.currentState!.validate();
    if (!isvalid) {
      return;
    }
    _form.currentState!.save();
    var isregis = await BlocProvider.of<RegisterBloc>(context)
      ..add(SignUpBtn(
          phone: phoneController.text,
          password: passwordController.text,
          email: emailController.text,
          fullname: fullnameController.text));
  }
//   /* -------------------------------------------------------------------------- */
  //                        todo END REGISTER METHOD                            */
//   /* -------------------------------------------------------------------------- */

  @override
  Widget build(BuildContext context) {
    /* -------------------------------------------------------------------------- */
    /*                       //  ! FORM VALIDATION PROVIDER                       */
    /* -------------------------------------------------------------------------- */
    final formvalid = Provider.of<AllFormValdation>(context);
    return Padding(
      padding: const EdgeInsets.only(right: 20.0, left: 20.0, top: 30.0),
      child: Form(
        key: _form,
        child: Column(children: [
          /* -------------------------------------------------------------------------- */
          /*                                 FORM FIELD                                 */
          /* -------------------------------------------------------------------------- */

          // NameEdit text
          EditFormFields(
              placeholder: 'Name',
              inputType: TextInputType.name,
              controller: fullnameController,
              formValidator: (v) => formvalid.reqValid(v)),
          EditFormFields(
            placeholder: 'Mobile',
            inputType: TextInputType.phone,
            controller: phoneController,
            formValidator: (v) => formvalid.mobileValidator(v),
          ),
          EditFormFields(
            placeholder: 'Email',
            inputType: TextInputType.emailAddress,
            controller: emailController,
            formValidator: (v) => formvalid.emailValidator(v),
          ),
          EditFormFields(
              obscureTxt: true,
              placeholder: 'Password',
              controller: passwordController,
              formValidator: (v) => formvalid.reqValid(v),
              inputType: TextInputType.visiblePassword),

          /* -------------------------------------------------------------------------- */
          /*                             // END  FORM FIELD                            */
          /* -------------------------------------------------------------------------- */

          /* -------------------------------------------------------------------------- */
          /*                                SUBMIT BUTTON   Start                             */
          /* -------------------------------------------------------------------------- */

          Padding(
            padding: EdgeInsets.only(top: 25.0, bottom: 0.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(
                    height: 60,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Center(
                          child: widget.bState is RegisterLoading
                              ? CupertinoActivityIndicator()
                              : SingleBtn(
                                  'Signup',
                                  submitMethod: _registerNow,
                                ),
                        )
                      ],
                    )),
              ],
            ),
          ),
          /* -------------------------------------------------------------------------- */
          /*                          END  SUBMIT BUTTON                              */
          /* -------------------------------------------------------------------------- */
          ExtraBtn(btnName: 'Login', submitMethod: LoginScr.routeName),
        ]),
      ),
    );
  }
}
