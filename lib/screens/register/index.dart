import 'package:flutter/material.dart';
import 'package:setlistherofl/screens/register/widgets/normalTextField/index.dart';
import 'package:setlistherofl/screens/register/widgets/passwordField/index.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({Key key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

const String _montserratFontFamily = 'Montserrat';

class _RegisterScreenState extends State<RegisterScreen> {
  //final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(children: <Widget>[
        Positioned(
          child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.6,
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                Colors.orange[900],
                Colors.orange[800],
                Colors.orange[400]
              ]))),
        ),
        Positioned(
          top: 80.0,
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Column(children: <Widget>[
              Container(
                margin: EdgeInsets.only(bottom: 16.0),
                  height: 150.0,
                  padding: EdgeInsets.only(bottom: 1),
                  child: Image.asset('lib/assets/images/logo.png'),
                  ),
              Text('Start rocking today!',
                  style: TextStyle(
                      fontSize: 24.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: _montserratFontFamily)),
            ]),
          ),
        ),
        Positioned(
          top: 320.0,
          child: Container(
            height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 40.0),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0)),
            ),
            child: Column(
              children: <Widget>[
                NormalTextField(label: "Name"),
                NormalTextField(label: "Username"),
                NormalTextField(label: "Email"),
                PasswordField(label: "Password"),
                PasswordField(
                  label: "Confirm Password",
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      color: Colors.orangeAccent[700]),
                  child: FlatButton(
                      onPressed: () {
                        print('Sign Up');
                      },
                      child: Text(
                        'REGISTER',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                            fontFamily: _montserratFontFamily),
                      )),
                )
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
