// import 'package:YOURDRS_FlutterAPP/network/models/location.dart';
// import 'package:YOURDRS_FlutterAPP/network/services/appointment_service.dart';
// import 'package:YOURDRS_FlutterAPP/widget/buttons/dropdowns.dart';
// import 'package:flutter/material.dart';
// import 'dart:async';
// import 'dart:convert';
// import 'package:http/http.dart' as http;

// class LocationDropDown extends StatefulWidget {
//   final onTapOfLocation;
//   final String selectedLocationId;
//   LocationDropDown({@required this.onTapOfLocation, this.selectedLocationId});
//   @override
//   _LocationState createState() => _LocationState();
// }

// class _LocationState extends State<LocationDropDown>
//     with AutomaticKeepAliveClientMixin {
//   var _currentSelectedValue;

//   List data = List(); //edited line
//   // List<LocationList> data = List();
//   Services apiServices = Services();

//   @override
//   void initState() {
//     super.initState();
//     // this.getLocation();
//     _currentSelectedValue = widget.selectedLocationId;
//   }

//   @override
//   void didChangeDependencies() async {
//     super.didChangeDependencies();
//     Location location = await apiServices.getLocation();
//     data = location.locationList;
//     setState(() {});
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(10),
//             child: Container(
//                 height: 55,
//                 width: MediaQuery.of(context).size.width * 0.85,
//                 child: FormField<String>(
//                   builder: (FormFieldState<String> state) {
//                     return InputDecorator(
//                       decoration: InputDecoration(
//                           border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(5.0))),
//                       isEmpty: _currentSelectedValue == '',
//                       child: DropdownButton<String>(
//                         value: _currentSelectedValue,
//                         isExpanded: true,
//                         hint: Text("Location"),
//                         onChanged: (value) {
//                           setState(() {
//                             _currentSelectedValue = value;
//                             print(_currentSelectedValue);
//                           });
//                           widget.onTapOfLocation(value);
//                         },
//                         items: data.map((item) {
//                           return DropdownMenuItem<String>(
//                             child: Text(
//                               item.locationName,
//                               overflow: TextOverflow.ellipsis,
//                             ),
//                             value: item.locationId.toString(),
//                           );
//                         }).toList(),
//                       ),
//                     );
//                   },
//                 )),
//           ),
//         ],
//       ),
//     );
//   }

//   @override
//   // TODO: implement wantKeepAlive
//   bool get wantKeepAlive => true;
// }
