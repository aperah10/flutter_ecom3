import 'package:flutter/material.dart';

class TxtTitle extends StatelessWidget {
  dynamic titleName;
  TxtTitle(
    this.titleName, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20.0, top: 10.0),
      child: Text(
        titleName,
        style: TextStyle(
          color: Colors.black,
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

/* -------------------------------------------------------------------------- */
/*                             // ! SUBTITLE TEXT                             */
/* -------------------------------------------------------------------------- */

class SubTxtTitle extends StatelessWidget {
  dynamic titleName;
  SubTxtTitle(
    this.titleName, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20.0, top: 10.0),
      child: Text(
        titleName,
        style: TextStyle(
          color: Colors.black, fontSize: 18.0,
          // fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

/* -------------------------------------------------------------------------- */
/*                             // ! TEXT CONTENT                            */
/* -------------------------------------------------------------------------- */
class TxtContent extends StatelessWidget {
  dynamic contName;
  TxtContent(
    this.contName, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20.0, top: 10.0),
      child: Text(
        contName,
        style: TextStyle(
            color: Color(0xff7990DD),
            fontSize: 15.0,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}

// // ! TRY CUSTOM CLASS FOR TEXTSTYLE
//   class CusTxtStyle {
//    static double? txtSize;
//  static Color? colrss;
//   CusTxtStyle();

//   static late TextStyle _titleLight = TextStyle(
//     color: colrss,
//     fontSize: txtSize,
//   );
  
// }

