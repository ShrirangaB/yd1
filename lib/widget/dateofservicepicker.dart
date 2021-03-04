import 'package:YOURDRS_FlutterAPP/common/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart';

class DateOfService extends StatefulWidget {
  @override
  _DateOfServiceState createState() => _DateOfServiceState();
}

class _DateOfServiceState extends State<DateOfService> {
  String _serviceDate = 'Service date';

  Future<void> _selectDate(BuildContext context) async {
    final DateTime d = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2015),
      lastDate: DateTime(2030),
    );
    if (d != null)
      setState(() {
        _serviceDate = DateFormat.yMMMMd("en_US").format(d);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Material(
        child: Center(
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
                        child: Text(_serviceDate,
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
