import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:loginapp/AddEmployer.dart';
import 'package:loginapp/Diary.dart';
import 'package:loginapp/Settings.dart';
import 'package:loginapp/WorkActivities.dart';
import 'package:loginapp/login.dart';
import 'package:http/http.dart' as http;

import 'models/ListEmployerData.dart';

class Employer extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<Employer> {
  //Map data;
  //List userData;
  List memberEmployersMob;
  List archivedMemberEmployersMob;

  //_MyHomePageState(this.memberEmployersMob);

  @override
  void initState() {
    getData();
    //getDummyData();
    super.initState();
  }

  // void getDummyData() async {
  //   http.Response response =
  //       await http.get("https://reqres.in/api/users?page=2");
  //   data = json.decode(response.body);
  //   setState(() {
  //     userData = data["data"];
  //   });
  // }

  void getData() async {
    var response = await http.get(
        Uri.encodeFull(
            "http://10.0.2.2:5000/api/v1/employer/GetAllMemberEmployers"),
        headers: {"Accept": "application/json"});

    setState(() {
      var responseJson = json.decode(response.body);
      memberEmployersMob = responseJson['MemberEmployersMob']
          .map((data) => MemberEmployerMob.fromJson(data))
          .toList()
          .cast<MemberEmployerMob>();

      archivedMemberEmployersMob = responseJson['ArchivedMemberEmployersMob']
          .map((data1) => ArchivedMemberEmployersMob.fromJson(data1))
          .toList()
          .cast<ArchivedMemberEmployersMob>();
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Employer"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              new MaterialPageRoute(builder: (context) => new AddEmployer()));
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.pink,
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: new Text(
                'Divya',
                style: TextStyle(fontSize: 18.0),
              ),
              accountEmail: new Text(
                'divya@pearlarc.com',
                style: TextStyle(fontSize: 17.0),
              ),
              currentAccountPicture: Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(
                              "http://tineye.com/images/widgets/mona.jpg")))),
            ),
            ListTile(
              leading: Icon(Icons.people, color: Colors.purple, size: 40.0),
              title: Text(
                "Employers",
                style: TextStyle(fontSize: 17.0),
              ),
              onTap: () {
                //Navigator.pushNamed(context, '/Login');
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => new Employer()));
              },
            ),
            ListTile(
              leading: Icon(Icons.work, color: Colors.purple, size: 40.0),
              title: Text(
                "Work Activities",
                style: TextStyle(fontSize: 17.0),
              ),
              onTap: () {
                //Navigator.pushNamed(context, '/Login');
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => new WorkActivities()));
              },
            ),
            ListTile(
              leading:
                  Icon(Icons.calendar_today, color: Colors.purple, size: 40.0),
              title: Text(
                "Diary",
                style: TextStyle(fontSize: 17.0),
              ),
              onTap: () {
                //Navigator.pushNamed(context, '/Login');
                Navigator.push(context,
                    new MaterialPageRoute(builder: (context) => new Diary()));
              },
            ),
            ListTile(
              leading: Icon(Icons.settings, color: Colors.purple, size: 40.0),
              title: Text(
                "Settings",
                style: TextStyle(fontSize: 17.0),
              ),
              onTap: () {
                //Navigator.pushNamed(context, '/Login');
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => new Settings()));
              },
            ),
            ListTile(
              leading: Icon(Icons.arrow_back, color: Colors.purple, size: 40.0),
              title: Text(
                "SignOut",
                style: TextStyle(fontSize: 17.0),
              ),
              onTap: () {
                //Navigator.pushNamed(context, '/Login');
                Navigator.push(context,
                    new MaterialPageRoute(builder: (context) => new Login()));
              },
            )
          ],
        ),
      ),
      body: new SingleChildScrollView(
        child: new Column(
          children: <Widget>[
            new Column(
              children: memberEmployersMob?.map((tx) {
                    print(tx);
                    return Card(
                      child: Column(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 10,
                            ),
                            // decoration: BoxDecoration(
                            //     border: Border.all(
                            //   color: Colors.purple,
                            //   width: 2,
                            // )),
                            padding: EdgeInsets.all(10),
                            child: Text(
                              '${tx.employerName}',
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 18,
                                color: Colors.purple,
                              ),
                            ),
                          ),
                          Column(
                            //crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Text(
                                tx.lastModifiedDate,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              // Text(
                              //   //DateFormat.yMMMd().format(tx.lastModifiedDate),
                              //   style: TextStyle(color: Colors.grey),
                              // )
                            ],
                          ),
                        ],
                      ),
                    );
                  })?.toList() ??
                  [],
            ),
            new Column(
              children: <Widget>[
                Text(
                  "ARCHIVED EMPLOYERS",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 19,
                    color: Colors.pink,
                  ),
                ),
                new Column(
                  children: archivedMemberEmployersMob?.map((ame) {
                        return Container(
                          child: Column(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.symmetric(
                                  vertical: 10,
                                  horizontal: 10,
                                ),
                                // decoration: BoxDecoration(
                                //     border: Border.all(
                                //   color: Colors.black,
                                //   width: 2,
                                // )),
                                padding: EdgeInsets.all(10),
                                child: Text(
                                  '${ame.employerName}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 18,
                                    color: Colors.purple,
                                  ),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    '${ame.lastModifiedDate}',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                  // Text(
                                  //   DateFormat.yMMMd().format(ame.date),
                                  //   style: TextStyle(color: Colors.grey),
                                  // )
                                ],
                              ),
                            ],
                          ),
                        );
                      })?.toList() ??
                      [],
                ),
                Divider(
                  color: Colors.black,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
