import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

import 'models/AddEmployerData.dart';
import 'models/api_response.dart';

class _InputDropdown extends StatelessWidget {
  const _InputDropdown({
    Key key,
    this.child,
    this.labelText,
    this.valueText,
    this.valueStyle,
    this.onPressed,
  }) : super(key: key);

  final String labelText;
  final String valueText;
  final TextStyle valueStyle;
  final VoidCallback onPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: labelText,
        ),
        baseStyle: valueStyle,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(valueText, style: valueStyle),
            Icon(
              Icons.arrow_drop_down,
              color: Theme.of(context).brightness == Brightness.light
                  ? Colors.grey.shade700
                  : Colors.white70,
            ),
          ],
        ),
      ),
    );
  }
}

class _DateTimePicker extends StatelessWidget {
  const _DateTimePicker({
    Key key,
    this.labelText,
    this.selectedDate,
    this.selectedTime,
    this.selectDate,
  }) : super(key: key);

  final String labelText;
  final DateTime selectedDate;
  final TimeOfDay selectedTime;
  final ValueChanged<DateTime> selectDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) selectDate(picked);
  }

  @override
  Widget build(BuildContext context) {
    final TextStyle valueStyle = Theme.of(context).textTheme.headline6;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Expanded(
          flex: 4,
          child: _InputDropdown(
            labelText: labelText,
            valueText: DateFormat.yMMMd().format(selectedDate),
            valueStyle: valueStyle,
            onPressed: () {
              _selectDate(context);
            },
          ),
        ),
        const SizedBox(width: 12.0),
      ],
    );
  }
}

class AddEmployer extends StatefulWidget {
  @override
  _AddEmployerState createState() => _AddEmployerState();
}

class _AddEmployerState extends State<AddEmployer> {
  static const API = 'http://10.0.2.2:5000/api/v1/employer/SaveMemberEmployer';
  static const headers = {'Content-Type': 'application/json'};

  Future<APIResponse<bool>> createNote(MemberEmployerVM item) {
    debugger();
    return http
        .post(API, headers: headers, body: json.encode(item.tojson()))
        .then((data) {
      if (data.statusCode == 201) {
        return APIResponse<bool>(data: true);
      }
      return APIResponse<bool>(error: true, errorMessage: 'An error occured');
    }).catchError((_) =>
            APIResponse<bool>(error: true, errorMessage: 'An error occured'));
  }

  TextEditingController searchController = new TextEditingController();
  TextEditingController dccController = new TextEditingController();
  TextEditingController spaController = new TextEditingController();
  TextEditingController epasController = new TextEditingController();

  int groupValue = 1;
  DateTime startDate = DateTime.now();
  bool isContractFullTime = true;
  DateTime endDate = DateTime.now();
  bool isMemberJobAnnualised = false;

  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),

          title: new Text('Add Employer'),
          //centerTitle: true,
          backgroundColor: Colors.pink,
          actions: <Widget>[
            //IconButton(icon: Icon(Icons.close),  onPressed: () => Navigator.of(context).pop()),
            FlatButton(
              textColor: Colors.white,
              onPressed: () async {
                debugger();
                final note = MemberEmployerVM(
                  employerName: searchController.text,
                  //startDate: DateTime.parse("2020-02-27 20:18:04Z"),
                  //endDate: endDate.toLocal(),
                  isContractFullTime: isContractFullTime,
                  isMemberJobAnnualised: isMemberJobAnnualised,
                  memberNumber: "TEST995",
                );
                final result = await createNote(note);
                final title = 'Done';
                final text = result.error
                    ? (result.errorMessage ?? 'An error occurred')
                    : 'Employer created successfully';
                showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                          title: Text(title),
                          content: Text(text),
                          actions: <Widget>[
                            FlatButton(
                              child: Text('Ok'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            )
                          ],
                        )).then((data) {
                  if (result.data) {
                    Navigator.of(context).pop();
                  }
                });
              },
              child: Text('SAVE'),
            ),
          ],
        ),
        body: SingleChildScrollView(
            child: Stack(
          children: <Widget>[
            new Container(
              padding: EdgeInsets.all(8.0),
              child: new Column(
                children: <Widget>[
                  new Text(
                    'Your role:',
                    style: new TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                  new Row(
                    children: <Widget>[
                      new Radio(
                        onChanged: (int e) => something(e),
                        value: 1,
                        groupValue: groupValue,
                        activeColor: Colors.pink,
                      ),
                      new Text(
                        'Consultant',
                        style: new TextStyle(fontSize: 16.0),
                      ),
                    ],
                  ),
                  new Row(
                    children: <Widget>[
                      new Radio(
                        onChanged: (int e) => something(e),
                        value: 2,
                        groupValue: groupValue,
                        activeColor: Colors.pink,
                      ),
                      new Text(
                        'Staff, associate specialist or speciality',
                        style: new TextStyle(fontSize: 16.0),
                      ),
                    ],
                  ),
                  new Text(
                    'NHS employer:',
                    style: new TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                  new TextField(
                    controller: searchController,
                    decoration: InputDecoration(
                      labelText: 'Search',
                    ),
                  ),
                  _DateTimePicker(
                    labelText: 'Start date',
                    selectedDate: startDate,
                    //selectedTime: _fromTime,
                    selectDate: (DateTime date) {
                      setState(() {
                        startDate = date;
                      });
                    },
                  ),
                  _DateTimePicker(
                    labelText: 'End date',
                    selectedDate: endDate,
                    //selectedTime: _toTime,
                    selectDate: (DateTime date) {
                      setState(() {
                        endDate = date;
                      });
                    },
                  ),
                  new Row(
                    children: <Widget>[
                      new Text(
                        'Is your contract full time?',
                        style: new TextStyle(fontSize: 16.0),
                      ),
                      Switch(
                        value: isContractFullTime,
                        onChanged: (value) {
                          setState(() {
                            isContractFullTime = value;
                          });
                        },
                        activeTrackColor: Colors.pink,
                        activeColor: Colors.pink,
                      ),
                    ],
                  ),
                  new Row(
                    children: <Widget>[
                      new Text(
                        'Is your contract fully annualised?',
                        style: new TextStyle(fontSize: 16.0),
                      ),
                      Switch(
                        value: isMemberJobAnnualised,
                        onChanged: (value) {
                          setState(() {
                            isMemberJobAnnualised = value;
                          });
                        },
                        activeTrackColor: Colors.pink,
                        activeColor: Colors.pink,
                      ),
                    ],
                  ),
                  Divider(
                    color: Colors.grey,
                  ),
                  new Text(
                    'PAs per week',
                    style: new TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                  new TextFormField(
                    controller: dccController,
                    decoration: InputDecoration(
                      labelText: 'DCC (normal contractual)*',
                    ),
                  ),
                  new TextFormField(
                    controller: spaController,
                    decoration: InputDecoration(
                      labelText: 'SPA *',
                    ),
                  ),
                  new TextFormField(
                    controller: epasController,
                    decoration: InputDecoration(
                      labelText: 'EPAs/APAs (extra-contractual)',
                    ),
                  ),
                ],
              ),
            ),
          ],
        )),
      ),
    );
  }

  void something(int e) {
    setState(() {
      if (e == 1) {
        groupValue = 1;
      } else {
        groupValue = 2;
      }
    });
  }
}
