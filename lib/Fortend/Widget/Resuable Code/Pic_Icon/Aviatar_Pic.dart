import 'package:flutter/material.dart';

import 'Iocns_C.dart';

/* -------------------------------------------------------------------------- */
/*                           // !AVIATOR PIC FOR :-                           */
/* -------------------------------------------------------------------------- */

class CusAvaitar extends StatelessWidget {
  const CusAvaitar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // ! PIC AVATOR HEIGHT AND WIDTH

      child: Stack(
        fit: StackFit.expand,
        children: [
          CircleAvatar(
            backgroundImage: AssetImage("images/app_logo.png"),
          ),
          Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                height: 45,
                width: 45,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    width: 4,
                    color: Theme.of(context).scaffoldBackgroundColor,
                  ),
                  color: Colors.green,
                ),
                child: Icon(
                  Icons.edit,
                  color: Colors.white,
                ),
              )),
        ],
      ),
    );
  }
}

// ! SECOND AVATOR PIC AND WIDTH
class CusAvaitar2 extends StatelessWidget {
  dynamic submitMethod;
  CusAvaitar2({Key? key, this.submitMethod}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Container(
            width: 130,
            height: 130,
            decoration: BoxDecoration(
                border: Border.all(
                    width: 4, color: Theme.of(context).scaffoldBackgroundColor),
                boxShadow: [
                  BoxShadow(
                      spreadRadius: 2,
                      blurRadius: 10,
                      color: Colors.black.withOpacity(0.1),
                      offset: Offset(0, 10))
                ],
                shape: BoxShape.circle,
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      "https://firebasestorage.googleapis.com/v0/b/dl-flutter-ui-challenges.appspot.com/o/img%2F1.jpg?alt=media",
                    ))),
          ),
          Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    width: 4,
                    color: Theme.of(context).scaffoldBackgroundColor,
                  ),
                  color: Colors.green,
                ),
                child: IconBtn(
                  Icons.edit,
                  submitMethod: submitMethod,
                ),
              )),
        ],
      ),
    );
  }
}
