import 'package:YOURDRS_FlutterAPP/common/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateOfBirth extends StatefulWidget {
  @override
  _DateOfBirthState createState() => _DateOfBirthState();
}

class _DateOfBirthState extends State<DateOfBirth> {
  String _birthDate = 'Date of Birth';

  Future<void> _selectDate(BuildContext context) async {
    final DateTime d = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1930),
      lastDate: DateTime.now(),
    );
    if (d != null)
      setState(() {
        _birthDate = DateFormat.yMMMMd("en_US").format(d);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Material(
        child: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width * 0.80,
                decoration: const BoxDecoration(
                    border: Border(
                      top: BorderSide(
                          width: 1.0, color: CustomizedColors.accentColor),
                      left: BorderSide(
                          width: 1.0, color: CustomizedColors.accentColor),
                      right: BorderSide(
                          width: 1.0, color: CustomizedColors.accentColor),
                      bottom: BorderSide(
                          width: 1.0, color: CustomizedColors.accentColor),
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      InkWell(
                        child: Text(_birthDate,
                            textAlign: TextAlign.center,
                            style:
                                TextStyle(color: CustomizedColors.accentColor)),
                        onTap: () {
                          _selectDate(context);
                        },
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.calendar_today_sharp,
                          color: CustomizedColors.accentColor,
                        ),
                        // tooltip: 'Tap to open date picker',
                        onPressed: () {
                          _selectDate(context);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
