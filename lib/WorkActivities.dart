import 'package:flutter/material.dart';
import 'package:loginapp/EditWorkActivities.dart';

class WorkActivities extends StatefulWidget {
  @override
  _WorkActivitiesState createState() => _WorkActivitiesState();
}

class _WorkActivitiesState extends State<WorkActivities> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Work Activities"),
        actions: <Widget>[
          new IconButton(
              icon: new Icon(Icons.edit),
              onPressed: () {
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => new EditWorkActivities()));
              }),
        ],
      ),
      body: BodyLayout(),
    );
  }
}

class BodyLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _mylistView(context);
  }
}

Widget _mylistView(BuildContext context) {
  return ListView(
    children: <Widget>[
      ListTile(
        title: Text('Direct clinical care'),
      ),
      Divider(
        color: Colors.black,
      ),
      ListTile(
        title: Text('Supporting professional activities'),
      ),
      Divider(
        color: Colors.black,
      ),
      ListTile(
        title: Text('Additional responsibilities'),
      ),
      Divider(
        color: Colors.black,
      ),
      ListTile(
        title: Text('External/Other duties'),
      ),
      Divider(
        color: Colors.black,
      ),
      ListTile(
        title: Text('Additional remunerated work'),
      ),
      Divider(
        color: Colors.black,
      ),
      ListTile(
        title: Text('Uncontracted time'),
      ),
    ],
  );
}
