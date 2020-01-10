import 'package:flutter/material.dart';
import 'dart:async';


class AddEmployer extends StatefulWidget {
  @override
  _AddEmployerState createState() => _AddEmployerState();
}

class _AddEmployerState extends State<AddEmployer> {
  int groupValue = 1;
  DateTime selectedDate = DateTime.now();
  bool isSwitched = true;
  DateTime selectedendDate = DateTime.now();
  bool contractisSwitched = false;
  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  Future<Null> _selectEndDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedendDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedendDate)
      setState(() {
        selectedendDate = picked;
      });
  }

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
            Container(padding: const EdgeInsets.all(20.0), child: Text('SAVE')),
            IconButton(icon: Icon(Icons.close), onPressed: () => Navigator.of(context).pop()),
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
                  new TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Search',
                    ),
                  ),
                  //Divider(),
                  new Row(
                    children: <Widget>[
                      RaisedButton(
                        onPressed: () => _selectDate(context),
                        child: Text('Start date'),
                      ),
                      Text("${selectedDate.toLocal()}"),
                    ],
                  ),
                  Divider(),
                  new Row(
                    children: <Widget>[
                      RaisedButton(
                        onPressed: () => _selectEndDate(context),
                        child: Text('End date'),
                      ),
                      Text("${selectedendDate.toLocal()}"),
                    ],
                  ),
                  Divider(),
                  new Row(
                    children: <Widget>[
                      new Text(
                        'Is your contract full time?',
                        style: new TextStyle(fontSize: 16.0),
                      ),
                      Switch(
                        value: isSwitched,
                        onChanged: (value) {
                          setState(() {
                            isSwitched = value;
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
                        value: contractisSwitched,
                        onChanged: (value) {
                          setState(() {
                            contractisSwitched = value;
                          });
                        },
                        activeTrackColor: Colors.pink,
                        activeColor: Colors.pink,
                      ),
                    ],
                  ),
                  Divider(),
                  new Text(
                    'PAs per week',
                    style: new TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                  new TextFormField(
                    decoration: InputDecoration(
                      labelText: 'DCC (normal contractual)*',
                    ),
                  ),

                  new TextFormField(
                    decoration: InputDecoration(
                      labelText: 'SPA *',
                    ),
                  ),

                  new TextFormField(
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
