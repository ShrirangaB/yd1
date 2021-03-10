import 'package:YOURDRS_FlutterAPP/common/app_colors.dart';
import 'package:YOURDRS_FlutterAPP/common/app_strings.dart';
import 'package:YOURDRS_FlutterAPP/network/models/practice.dart';

import 'package:flutter/material.dart';

import 'package:YOURDRS_FlutterAPP/network/services/appointment_service.dart';
import 'package:flutter/material.dart';
import 'package:searchable_dropdown/searchable_dropdown.dart';

class PracticeDropDown extends StatefulWidget {
  final onTapOfPractice;
  final String selectedPracticeId;
  PracticeDropDown({@required this.onTapOfPractice, this.selectedPracticeId});
  @override
  _PracticeState createState() => _PracticeState();
}

class _PracticeState extends State<PracticeDropDown>
    with AutomaticKeepAliveClientMixin {
  var _currentSelectedValue;
  bool asTabs = false;
  Services apiServices = Services();
  PracticeList practiceList;
  //List<LocationList> _list=[];
  List data = List();

  void initState() {
    super.initState();
    _currentSelectedValue = widget.selectedPracticeId;
  }

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    Practices practice = await apiServices.getPratices();
    data = practice.practiceList;

//_currentSelectedValue=data;
    setState(() {});
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
    return Container(
      //height: 55,
      //color: Colors.yellow,
      //height: MediaQuery.of(context).size.height * 0.07,
      //alignment: Alignment.center,
      //padding: const EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width * 0.86,
      child: SearchableDropdown.single(
        hint: Text('Select'),
        // label: Text('Location',style: TextStyle(
        //     fontSize: 16,fontWeight: FontWeight.bold,
        //     color: Colors.black
        // ),),
        items: data.map((item) {
          return DropdownMenuItem<PracticeList>(
              child: Text(
                item.name,
                overflow: TextOverflow.ellipsis,
              ),
              value: item);
        }).toList(),
        isExpanded: true,
        value: practiceList,
        searchHint: new Text('Select ', style: new TextStyle(fontSize: 20)),
        onChanged: (value) {
          setState(() {
            _currentSelectedValue = value;
            widget.onTapOfPractice(value);
            // practiceList=value;
            // print('practiceList $practiceList');
          });
        },
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black38,
        ),
        borderRadius: BorderRadius.circular(6),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
