import 'package:flutter/material.dart';

class IconBtn extends StatelessWidget {
  IconData? iconD;
  dynamic submitMethod;
  IconBtn(this.iconD, {Key? key, this.submitMethod}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new SizedBox(
        height: 30.0,
        width: 30.0,
        child: new IconButton(
          padding: new EdgeInsets.all(0.0),
          color: Colors.deepOrange,
          icon: new Icon(iconD, size: 25.0),
          onPressed: submitMethod,
        ));
  }
}

/* -------------------------------------------------------------------------- */
/*                               // ! ICON BTN2                               */
/* -------------------------------------------------------------------------- */

class IconBtn2 extends StatelessWidget {
  IconData? icon;
  IconBtn2({Key? key, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      splashColor: Colors.redAccent.shade200,
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Icon(
            icon,
            color: Colors.redAccent,
            size: 20,
          ),
        ),
      ),
    );
  }
}
