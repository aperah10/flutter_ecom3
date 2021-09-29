import 'package:flutter/material.dart';

// ! main drop DropDownBtn AND
class DropDownBtn extends StatefulWidget {
  String? dName;
  dynamic listData;
  String pageName;
  String? currentItem;
  TextEditingController? listController = new TextEditingController();

  String? Function(String?)? formValidator;
  DropDownBtn(
      {Key? key,
      this.dName,
      this.listData,
      this.listController,
      this.pageName = 'Item',
      this.formValidator,
      this.currentItem})
      : super(key: key);

  @override
  _DropDownBtnState createState() => _DropDownBtnState();
}

class _DropDownBtnState extends State<DropDownBtn> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: DropdownButtonFormField<String>(
        // ! DROP DOWN MENU dropdownValue

        value: widget.currentItem,
        validator: widget.formValidator,
        isExpanded: true,
        icon: const Icon(Icons.arrow_downward),
        iconSize: 24,
        elevation: 16,
        style: const TextStyle(color: Colors.deepPurple),

        onChanged: (String? newValue) {
          setState(() {
            widget.currentItem = newValue;
            widget.listController!.text = newValue!;
          });
        },

        items: widget.listData.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),

        // ! DROP DOWN MENU Dname
        hint: Text(widget.currentItem == null
            ? widget.pageName.toString()
            : widget.dName.toString()),
      ),
    );
  }
}
