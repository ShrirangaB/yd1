import 'package:YOURDRS_FlutterAPP/network/models/provider.dart';
import 'package:YOURDRS_FlutterAPP/network/services/appointment_service.dart';
import 'package:YOURDRS_FlutterAPP/widget/buttons/dropdowns.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ProviderDropDowns extends StatefulWidget {
  final onTapOfProvider;
  final String selectedProviderId;
  ProviderDropDowns({@required this.onTapOfProvider, this.selectedProviderId});
  @override
  _ProviderState createState() => _ProviderState();
}

class _ProviderState extends State<ProviderDropDowns> {
  var _currentSelectedValue;
  final String url = "https://jsonplaceholder.typicode.com/users";

  List data = List(); //edited line
  Services apiServices = Services();

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() async {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    Provider provider = await apiServices.getProviders();
    data = provider.providerList;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
                height: 55,
                width: MediaQuery.of(context).size.width * 0.85,
                child: FormField<String>(
                  builder: (FormFieldState<String> state) {
                    return InputDecorator(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0))),
                      isEmpty: _currentSelectedValue == '',
                      child: DropDown(
                        value: _currentSelectedValue,
                        hint: "Provider",
                        onChanged: (String newValue) {
                          setState(() {
                            _currentSelectedValue = newValue;
                            state.didChange(newValue);
                            print('Provider:' + _currentSelectedValue);
                            widget.onTapOfProvider(newValue);
                          });
                        },
                        items: data.map((item) {
                          return DropdownMenuItem<String>(
                            child: Text(item.displayname),
                            value: item.providerId.toString(),
                          );
                        }).toList(),
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
