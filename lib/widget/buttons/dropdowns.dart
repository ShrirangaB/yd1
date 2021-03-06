import 'package:flutter/material.dart';

//stateless Widget for Common DropDown Button
class DropDown extends StatelessWidget {
  final String hint;

  final String value;
  final onChanged;
  final items;
  DropDown(
      {@required this.hint,
      @required this.value,
      @required this.onChanged,
      @required this.items});
  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton<String>(
          isExpanded: true,
          hint: Text(hint),
          value: value,
          isDense: true,
          onChanged: onChanged,
          items: items),
    );
  }
}
