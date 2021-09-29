import 'package:flutter/material.dart';

/* -------------------------------------------------------------------------- */
/*                   // ! SINGLE BUTTON :- 1 BUTTON IN PAGE                   */
/* -------------------------------------------------------------------------- */
class SingleBtn extends StatelessWidget {
  String btnName;
  dynamic submitMethod;
  SingleBtn(this.btnName, {Key? key, this.submitMethod}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 3, left: 3),
        child: MaterialButton(
          minWidth: double.infinity,
          height: 70,
          onPressed: submitMethod,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
          child: Ink(
            decoration: BoxDecoration(
              // ! Cricle Border
              borderRadius: BorderRadius.circular(40),
              border: Border(
                bottom: BorderSide(color: Colors.black),
                top: BorderSide(color: Colors.black),
                left: BorderSide(color: Colors.black),
                right: BorderSide(color: Colors.black),
              ),
              gradient: LinearGradient(
                  colors: [new Color(0xff374ABE), new Color(0xff64B6FF)],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight),
              // borderRadius: BorderRadius.all(Radius.circular(5.0))
            ),
            child: Container(
              constraints: BoxConstraints(
                  maxWidth: 300.0,
                  minHeight: 40.0,
                  maxHeight: 55.0), // min sizes for Material buttons
              alignment: Alignment.center,
              child: Text(
                btnName,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 20.0),
              ),
            ),
          ),
        ));
  }
}

/* -------------------------------------------------------------------------- */
/*                    // ! MULTIPLE BUTTON 2 BUTTON IN PAGE                   */
/* -------------------------------------------------------------------------- */
class MultipleBtn extends StatelessWidget {
  String btnName;
  dynamic submitMethod;

  MultipleBtn(
    this.btnName, {
    Key? key,
    this.submitMethod,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      constraints: BoxConstraints(
          maxWidth: 300.0, minWidth: 100.0, minHeight: 40.0, maxHeight: 60.0),
      padding: EdgeInsets.only(top: 3, left: 3),
      child: MaterialButton(
        elevation: 0,
        onPressed: submitMethod,
        child: Container(
          width: double.infinity,
          height: 60.0,
          decoration: BoxDecoration(
            // ! Cricle Border
            borderRadius: BorderRadius.circular(20),
            border: Border(
              bottom: BorderSide(color: Colors.white70),
              top: BorderSide(color: Colors.white70),
              left: BorderSide(color: Colors.white70),
              right: BorderSide(color: Colors.white70),
            ),
            gradient: LinearGradient(
                colors: btnName == 'Buy'
                    ? [new Color(0xff374ABE), new Color(0xff64B6FF)]
                    : [new Color(0xff374ABE), new Color(0xff64B6FF)],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight),
            // borderRadius: BorderRadius.all(Radius.circular(5.0))
          ),
          padding: EdgeInsets.all(15.0),
          child: Text(
            btnName,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20.0,
                color: Colors.white,
                fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}

/* -------------------------------------------------------------------------- */
/*                   // ! FOURTH BTN :-  4 BUTTON IN ON PAGE                  */
/* -------------------------------------------------------------------------- */
class ForthBtn extends StatelessWidget {
  String btnName;
  dynamic submitMethod;
  ForthBtn(this.btnName, {Key? key, this.submitMethod}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
            onTap: submitMethod,
            child: Container(
                height: 50,
                width: 80,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.redAccent, Colors.red],
                      begin: Alignment.topLeft,
                      end: Alignment.topRight,
                    ),
                    borderRadius: BorderRadius.circular(10.0)),
                child: Center(
                    child: Text(btnName,
                        style: TextStyle(color: Colors.white, fontSize: 15))))),
      ),
    );
  }
}

/* -------------------------------------------------------------------------- */
/*                              // ! EXTRA BUTTON                             */
/* -------------------------------------------------------------------------- */
class ExtraBtn extends StatelessWidget {
  String btnName;
  dynamic submitMethod;
  ExtraBtn({Key? key, required this.btnName, this.submitMethod})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            margin: EdgeInsets.only(top: 20.0),
            padding: EdgeInsets.only(bottom: 30.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Already have an account? "),
                GestureDetector(
                  child: Text(
                    btnName,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onTap: () {
                    // Navigator.of(context).push(
                    //     MaterialPageRoute(builder: (context) => createPage()));
                  },
                )
              ],
            )));
  }
}

/* -------------------------------------------------------------------------- */
/*                            // ! INFORMATION BTN                            */
/* -------------------------------------------------------------------------- */
class InformationBtn extends StatelessWidget {
  const InformationBtn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(left: 25.0, top: 20.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            MultipleBtn(
              '4.5 star',
            ),
            MultipleBtn(
              'Comments',
            ),
            MultipleBtn(
              '49 Reviews',
            ),
          ],
        ));
  }
}
