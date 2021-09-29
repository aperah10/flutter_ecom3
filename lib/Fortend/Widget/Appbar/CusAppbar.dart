import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  CustomAppBar({
    Key? key,
    required this.titleName,
    this.createPage,
    this.act,
  })  : preferredSize = Size.fromHeight(kToolbarHeight),
        super(key: key);

  final String titleName;
  // final Widget Function() createPage;
  dynamic createPage;
  List<Widget>? act = [];

  @override
  final Size preferredSize;

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  _CustomAppBarState();

  @override
  Widget build(BuildContext context) {
    return AppBar(
        // ! 1. TITLE FOR APPBAR
        title: AppBarTitle(
          titleName: widget.titleName,
        ),
        // orc TITLE FOR APPBAR
        backgroundColor: Colors.white,
        elevation: 5.0,
        automaticallyImplyLeading: false,

        // ! 2. LEADING WIDGET FOR APPBAR
        leading: AppBarLeadItem(createPage: widget.createPage),
        // orc END  LEADING  FOR APPBAR

        // ! 3. ACTIONS  LIST WIDGET APPBAR LIST OF ITEM
        actions: widget.act);
  }
}

/* -------------------------------------------------------------------------- */
/*                          // ! 1. TITLE FOR APPBAR                           */
/* -------------------------------------------------------------------------- */
class AppBarTitle extends StatelessWidget {
  dynamic titleName;
  AppBarTitle({Key? key, this.titleName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      titleName,
      style: TextStyle(color: Colors.black),
    );
  }
}

/* -------------------------------------------------------------------------- */
/*                      //  ! 2. LEADING ITEM  FOR APPBAR                       */
/* -------------------------------------------------------------------------- */
class AppBarLeadItem extends StatelessWidget {
  dynamic createPage;

  AppBarLeadItem({Key? key, this.createPage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => createPage()));
      },
      child: Container(
        child: Icon(
          Icons.arrow_back,
          color: Colors.black,
        ),
      ),
    );
  }
}

// ! ACTIONS LIST OF APPBAR
