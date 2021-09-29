import 'package:flutter/material.dart';

class EditFormFields extends StatefulWidget {
  bool obscureTxt;
  final TextInputType? inputType;
  final String? placeholder;
  String? labelText;
  bool? status;
  String? pageName;
  dynamic savedValue;
  String? initValue;
  final TextEditingController? controller;
  String? Function(String?)? formValidator;
  bool brd;
  EditFormFields(
      {Key? key,
      this.inputType,
      this.placeholder,
      this.controller,
      this.formValidator,
      this.labelText,
      this.status,
      this.pageName,
      this.brd = true,
      this.savedValue,
      this.initValue,
      this.obscureTxt = false})
      : super(key: key);

  @override
  _FieldFState createState() => _FieldFState();
}

class _FieldFState extends State<EditFormFields> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 5.0),
      child: Container(
        height: 75,
        width: widget.pageName == null ? double.infinity : 700,
        margin: EdgeInsets.only(),
        child: TextFormField(
          initialValue: widget.initValue,
          obscureText: widget.obscureTxt,
          controller: widget.controller,
          keyboardType: widget.inputType,
          minLines: 1,
          validator: widget.formValidator,
          autofocus: false,
          decoration: InputDecoration(
              labelText: widget.labelText,
              hintText: widget.placeholder,
              // Set text upper animation
              border: widget.brd ? OutlineInputBorder() : null,
              suffixIcon: Padding(
                padding: EdgeInsets.symmetric(horizontal: 6.0),
                child: widget.placeholder == 'Password' &&
                        widget.inputType == TextInputType.visiblePassword
                    ? IconButton(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onPressed: () {
                          setState(() {
                            widget.obscureTxt = !widget.obscureTxt;
                          });
                        },
                        icon: Icon(
                          widget.obscureTxt
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.grey,
                        ),
                      )
                    : null,
              )),
        ),
      ),
    );
  }
}

/* -------------------------------------------------------------------------- */
/*                            // !SHOW FORM FILEDS                            */
/* -------------------------------------------------------------------------- */

class ShowFormFields extends StatefulWidget {
  String? placeholder;
  bool status;
  String? labelText;
  String? pageName;
  dynamic initValue;
  bool brd;

  ShowFormFields({
    Key? key,
    this.placeholder,
    this.status = true,
    this.initValue,
    this.labelText,
    this.pageName,
    this.brd = true,
  }) : super(key: key);

  @override
  _ShowFormFieldsState createState() => _ShowFormFieldsState();
}

class _ShowFormFieldsState extends State<ShowFormFields> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 2.0),
        child: new Row(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            new Flexible(
              child: new TextFormField(
                decoration: InputDecoration(hintText: widget.placeholder),
                // ! STATUS MEHTOD
                enabled: !widget.status,
                minLines: 1,
                initialValue: widget.initValue,
                autofocus: false,
              ),
            ),
          ],
        ));
  }
}
