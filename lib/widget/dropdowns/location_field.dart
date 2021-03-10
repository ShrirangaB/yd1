import 'package:YOURDRS_FlutterAPP/common/app_colors.dart';
import 'package:YOURDRS_FlutterAPP/common/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:YOURDRS_FlutterAPP/network/models/location_field_model.dart';

import 'package:YOURDRS_FlutterAPP/network/services/appointment_service.dart';
import 'package:searchable_dropdown/searchable_dropdown.dart';

class Locations extends StatefulWidget {
  final String PracticeIdList;
  final onTapOfLocation;
  const Locations(
      {@required this.onTapOfLocation, @required this.PracticeIdList});
  @override
  _LocationsState createState() => _LocationsState();
}

class _LocationsState extends State<Locations> {
  bool asTabs = false;
  Services apiServices = Services();
  LocationList locationsList;
  //List<LocationList> _list=[];
  List data = List();
  String practiceId;

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    // print('didChangeDependencies PracticeIdList ${widget.PracticeIdList}');
    // ExternalLocation externalLocation = await apiServices.getExternalLocation(widget.PracticeIdList);
    // data = externalLocation.locationList;

//_currentSelectedValue=data;
//     setState(() {});
  }

  List<Widget> get appBarActions {
    return ([
      Center(child: Text("Tabs:")),
      Switch(
        activeColor: Colors.white,
        value: asTabs,
        onChanged: (value) {
          setState(() {
            asTabs = value;
          });
        },
      )
    ]);
  }

  @override
  Widget build(BuildContext context) {
    if (practiceId == null ||
        (widget.PracticeIdList != null &&
            practiceId != widget.PracticeIdList)) {
      practiceId = widget.PracticeIdList;
      apiServices.getExternalLocation(practiceId).then((value) {
        data = value.locationList;
        setState(() {});
      });
    }

    //print('build PracticeIdList ${widget.PracticeIdList}');
    return Container(
        // alignment: Alignment.center,
        // padding: const EdgeInsets.all(10),
        //height: MediaQuery.of(context).size.height * 0.07,
        width: MediaQuery.of(context).size.width * 0.86,
        child: SearchableDropdown.single(
          items: data.map((item) {
            return DropdownMenuItem<LocationList>(
                child: Text(
                  item.name,
                  overflow: TextOverflow.ellipsis,
                ),
                value: item);
          }).toList(),
          isExpanded: true,
          value: locationsList,
          searchHint: new Text('Select ', style: new TextStyle(fontSize: 20)),
          onChanged: (value) {
            setState(() {
              locationsList = value;
              print('locationsList $locationsList');
            });
          },
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black38,
          ),
          borderRadius: BorderRadius.circular(6),
        ));
  }
}
