import 'package:YOURDRS_FlutterAPP/common/app_colors.dart';
import 'package:YOURDRS_FlutterAPP/common/app_strings.dart';
import 'package:flutter/material.dart';

class DocumentType extends StatefulWidget {
  @override
  _DocumentTypeState createState() => _DocumentTypeState();
}

class _DocumentTypeState extends State<DocumentType> {
  var _currentSelectedValue;
  var _currencies = [
    "Document Type",
    "Appointment Type",
    "Practise",
    "Provider",
    "Location",
    "Status",
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
//color: Colors.yellow,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(5),
            child: Text(
              AppStrings.documentType,
              style: TextStyle(
                fontSize: 17,
                color: CustomizedColors.accentColor,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Container(
                height: 58,
                width: 350,
                child: FormField<String>(
                  builder: (FormFieldState<String> state) {
                    return InputDecorator(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0))),
                      isEmpty: _currentSelectedValue == '',
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: _currentSelectedValue,
                          isDense: true,
                          onChanged: (String newValue) {
                            setState(() {
                              _currentSelectedValue = newValue;
                              state.didChange(newValue);
                            });
                          },
                          items: _currencies.map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    );
                  },
                )),
          ),
        ],
      ),
    );
  }
}
