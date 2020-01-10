import 'package:flutter/material.dart';
//import 'package:http/http.dart' as http;
import 'package:loginapp/Employer.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _showPassword = false;
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

  // void getData() async {
  //   var response = await http.get(
  //       Uri.encodeFull(
  //           "http://10.0.2.2:5000/api/v1/employer/GetAllMemberEmployers"),
  //       headers: {"Accept": "application/json"});
  //   print(response.body);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Image.asset(
            "assets/images/BMAIconLogo.png",
            fit: BoxFit.cover,
          ),
          // actions: <Widget>[
          //   new IconButton(
          //    icon: new Icon(Icons.close),
          //    onPressed: () => Navigator.of(context).pop(null),
          //  ),
          //  ],
          backgroundColor: Colors.purple,
        ),
        body: Column(
          children: <Widget>[
            Container(
                color: Colors.transparent,
                margin: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 10.0),
                //padding: EdgeInsets.fromLTRB(20.0, 40.0, 30.0, 0.0),
                child: Center(
                  child: new Text(
                    "BMA member sign in\n\n"
                    "Not a member?Join the BMA",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14.0, color: Colors.black),
                  ),
                )),
            Container(
              margin: EdgeInsets.all(10.0),
              child: TextFormField(
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Email id required';
                  }
                  return null;
                },
                obscureText: false,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(4.0, 25.0, 10.0, 4.0),
                  labelText: 'Email',
                  fillColor: Colors.black,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10.0),
              child: TextFormField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(4.0, 25.0, 10.0, 4.0),
                  labelText: 'Password',
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        _showPassword = !_showPassword;
                      });
                    },
                    child: Icon(
                      _showPassword ? Icons.visibility : Icons.visibility_off,
                    ),
                  ),
                  fillColor: Colors.black,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                ),
                obscureText: !_showPassword,
              ),
            ),
            Container(
              width: 700.0,
              margin: EdgeInsets.all(10.0),
              child: RaisedButton(
                color: Colors.pink,
                onPressed: () {
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => new Employer()));
                },
                child: new Text(
                  'Sign In',
                  style: new TextStyle(fontSize: 15.0, color: Colors.white),
                ),
              ),
            ),
            Container(
                color: Colors.transparent,
                margin: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 10.0),
                child: Center(
                  child: new Text(
                    "BMA member but don't have a web account?\n\n"
                    "Create a web account\n\n"
                    "v4.6.4",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 13.0, color: Colors.black),
                  ),
                )),
            // Container(
            //   child: Center(
            //   child: new TextField(
            //     decoration: InputDecoration(
            //         border: InputBorder.none, hintText: 'Enter a search'),
            //   ),
            //   ),
            // )
          ],
        ));
  }
}
