import 'package:flutter/material.dart';
import 'package:loginapp/WorkActivities.dart';

class EditWorkActivities extends StatefulWidget {
  @override
  _EditWorkActivitiesState createState() => _EditWorkActivitiesState();
}

class _EditWorkActivitiesState extends State<EditWorkActivities> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit work categories"),
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.close),
            onPressed: () {
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => new WorkActivities()));
            },
          ),
          new IconButton(
            icon: new Icon(Icons.save),
            onPressed: () {
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => new WorkActivities()));
            },
          )
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
        title: Text('Additional responsibilities'),

      ),
      // Switch(
        
      // ),
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
        title: Text('Academic work'),
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
