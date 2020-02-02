import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;

import 'models/AddEmployerData.dart';


Future<Post> createPost(String url, {Map body}) async {
  print(body);
  return http.post(url, body: body).then((http.Response response) {
    
    debugger();
    print(response.body);
    final int statusCode = response.statusCode;
    

    if (statusCode < 200 || statusCode > 400 || json == null) {
      throw new Exception("Error while fetching data");
    }
    return Post.fromJson(json.decode(response.body));
  });
}

class AddEmployer extends StatefulWidget {
  @override
  _AddEmployerState createState() => _AddEmployerState();
}

class _AddEmployerState extends State<AddEmployer> {
  
  // final Future<Post> post;
  // _AddEmployerState({Key key, this.post}) : super(key: key);
  static final createPostUrl=
      'http://10.0.2.2:5000/api/v1/employer/SaveMemberEmployer';
  TextEditingController searchController = new TextEditingController();
  TextEditingController dccController = new TextEditingController();
  TextEditingController spaController = new TextEditingController();
  TextEditingController epasController = new TextEditingController();

  int groupValue = 1;
  DateTime startDate = DateTime.now();
  bool isContractFullTime = true;
  DateTime endDate = DateTime.now();
  bool isMemberJobAnnualised = false;
  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: startDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != startDate)
      setState(() {
        startDate = picked;
      });
  }

  Future<Null> _selectEndDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: endDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != endDate)
      setState(() {
        endDate = picked;
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
          // actions: <Widget>[
          //   IconButton(
          //   child: Text('SAVE')

          //   ),
          //   IconButton(icon: Icon(Icons.close),  onPressed: () => Navigator.of(context).pop()),
          // ],
          actions: <Widget>[
            FlatButton(
              textColor: Colors.white,
              onPressed: () {},
              child: Text("Save"),
              shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
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
                  //Divider(),
                  new Row(
                    children: <Widget>[
                      RaisedButton(
                        onPressed: () => _selectDate(context),
                        child: Text('Start date'),
                      ),
                      Text("${startDate.toLocal()}"),
                    ],
                  ),
                  Divider(),
                  new Row(
                    children: <Widget>[
                      RaisedButton(
                        onPressed: () => _selectEndDate(context),
                        child: Text('End date'),
                      ),
                      Text("${endDate.toLocal()}"),
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
                  Divider(),
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

                  new RaisedButton(
                    onPressed: () async {
                      debugger();
                      Post newPost = new Post(
                        //employerId: "0",
                        name: searchController.text,
                        //IsMemberJobAnnualised: isSwitched,
                      );
                      Post p = await createPost(createPostUrl,
                          body: newPost.toMap());
                      print(newPost.toMap());
                      print(p.name);
                    },
                    child: const Text("SAVE"),
                  )
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
