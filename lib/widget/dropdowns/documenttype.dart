import 'package:YOURDRS_FlutterAPP/common/app_colors.dart';
import 'package:YOURDRS_FlutterAPP/network/models/document_type.dart';
import 'package:flutter/material.dart';
import 'package:YOURDRS_FlutterAPP/network/services/appointment_service.dart';
import 'package:searchable_dropdown/searchable_dropdown.dart';

class DocumentDropDown extends StatefulWidget {
  @override
  _DocumentState createState() => _DocumentState();
}

class _DocumentState extends State<DocumentDropDown>
    with AutomaticKeepAliveClientMixin {
  bool asTabs = false;
  //------------------service
  Services apiServices = Services();
  ExternalDocumentTypesList externalDocumentTypesList;
  //List<LocationList> _list=[];
  List data = List();

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    Documenttype document = await apiServices.getDocumenttype();
    data = document.externalDocumentTypesList;

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
      decoration: BoxDecoration(
        border: Border.all(width: 2, color: CustomizedColors.accentColor),
      ),
      alignment: Alignment.center,
      padding: const EdgeInsets.all(10),
      width: 320,
      child: SearchableDropdown.single(
        validator: (value) => value == null ? 'Cannot be empty' : null,
        hint: Text('Document Type'),
        // label: Text('',style: TextStyle(
        //     fontSize: 16,fontWeight: FontWeight.bold,
        //     color: Colors.black
        // ),),
        items: data.map((item) {
          return DropdownMenuItem<ExternalDocumentTypesList>(
              child: Text(
                item.externalDocumentTypeName,
                overflow: TextOverflow.ellipsis,
              ),
              value: item);
        }).toList(),
        isExpanded: true,
        underline: Padding(
          padding: EdgeInsets.all(1),
        ),
        value: externalDocumentTypesList,
        searchHint: Text('Select ', style: TextStyle(fontSize: 20)),
        onChanged: (value) {
          setState(() {
            externalDocumentTypesList = value;
            print('externalDocumentTypesList' + "$externalDocumentTypesList");
          });
        },
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
