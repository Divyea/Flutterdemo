import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:loginapp/AddEmployer.dart';
import 'package:loginapp/Diary.dart';
//import 'package:loginapp/EmployerData.dart';
import 'package:loginapp/Settings.dart';
import 'package:loginapp/WorkActivities.dart';
import 'package:loginapp/login.dart';
import 'package:http/http.dart' as http;

class Employer extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<Employer> {
  Map data;
  List userData;
  var unArchiveList;
  var archiveList;
  //List<archiveList> _items1 = [];
  @override
  void initState() {
    debugger();
    getData();
    getDummyData();
    super.initState();
  }

  void getDummyData() async {
    http.Response response =
        await http.get("https://reqres.in/api/users?page=2");
    data = json.decode(response.body);
    setState(() {
      userData = data["data"];
    });
  }

  void getData() async {
    var response = await http.get(
        Uri.encodeFull(
            "https://doctordiary.bma.org.uk/api/v1/employer/GetAllMemberEmployers"),
        headers: {"Accept": "application/json"});
    var responseBody = json.decode(response.body);

    setState(() {
      this.unArchiveList = responseBody.MemberEmployersMob;
      this.archiveList = responseBody.ArchivedMemberEmployersMob;
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
      // body: ListView(
      //   children: <Widget>[

      //     ListTile(
      //       title: Text('Direct clinical care'),
      //       subtitle: Text('Last modified :'),
      //     ),
      //     Divider(
      //       color: Colors.grey,
      //     )
      //   ],
      // )
    );
  }
}
