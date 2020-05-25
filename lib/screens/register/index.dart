import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:setlistherofl/routes.dart';
import 'package:setlistherofl/screens/register/widgets/normalTextField/index.dart';
import 'package:setlistherofl/screens/register/widgets/passwordField/index.dart';
import 'package:setlistherofl/service_locator.dart';
import 'package:setlistherofl/services/auth_service.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({Key key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

const String _montserratFontFamily = 'Montserrat';

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _controllerDisplayName = TextEditingController();
  final TextEditingController _controllerUsername = TextEditingController();
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
  final TextEditingController _controllerPasswordConfirmation =
      TextEditingController();

  var _validationDisplayName = false;
  var _validationUsername = false;
  var _validationEmail = false;
  var _validationPassword = false;
  var _validationPasswordConfirmation = false;

  var _touchedDisplaynameTextfield = false;
  var _touchedUsernameTextfield = false;
  var _touchedEmailTextfield = false;
  var _touchedPasswordTextfield = false;
  var _touchedPasswordConfirmationTextfield = false;

  String _errorMessagePassword = "";

  final AuthService _auth = locator<AuthService>();

  @override
  void dispose() {
    _controllerDisplayName.dispose();
    _controllerUsername.dispose();
    _controllerEmail.dispose();
    _controllerPassword.dispose();
    _controllerPasswordConfirmation.dispose();
    super.dispose();
  }

  void _validateEmail(String s) {
    RegExp regExp = RegExp(
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");

    setState(() {
      _touchedEmailTextfield = true;
      _validationEmail = regExp.hasMatch(s.trim());
    });

    print(_validationEmail);
  }

  void _validateDisplayName(String s) {
    setState(() {
      _touchedDisplaynameTextfield = true;
      _validationDisplayName = s.isNotEmpty || s.trim().isNotEmpty;
    });

    print(_validationDisplayName);
  }

  void _validateUsername(String s) {
    String s1 = s.trim();

    setState(() {
      _touchedUsernameTextfield = true;
      _validationUsername = !(s1.contains('@') || s1.contains(' '));
    });

    print(_validationUsername);
  }

  void _validatePassword(String s) {
    setState(() {
      _touchedPasswordTextfield = true;
      _validationPassword = s.length >= 8 &&
          s.contains(RegExp(r'[A-Z]')) &&
          s.contains(RegExp(r'[a-z]')) &&
          s.contains(RegExp(r'[0-9]')) &&
          s.contains(RegExp(r'[!@#$%^&*.]'));
    });
    print(_validationPassword);
  }

  void _validatePasswordConfirmation(String s) {
    setState(() {
      _touchedPasswordConfirmationTextfield = true;
      _validationPassword = s == _controllerPassword.text;
    });

    print(_validationPasswordConfirmation);
  }

  void _registerUser() async {
    if (_validationDisplayName &&
        _validationUsername &&
        _validationEmail &&
        _validationPassword &&
        _validationPasswordConfirmation) {

      dynamic result = await _auth.register(
          email: _controllerEmail.text.toString().trim(),
          username: _controllerUsername.text.toString().trim(),
          password: _controllerPassword.text.toString(),
          displayName: _controllerDisplayName.text.toString().trim());

      if (result == null) {
        print("NO SE PUDO REGISTRAR");
      } else {
        await _auth.loginWithPassword(_controllerEmail.text.toString().trim(), _controllerPassword.text.toString().trim());
        Navigator.popAndPushNamed(context, homeRoute);
      }
    } else {
      print("asd");
      setState(() {
        _touchedDisplaynameTextfield = true;
        _touchedUsernameTextfield = true;
        _touchedEmailTextfield = true;
        _touchedPasswordTextfield = true;
        _touchedPasswordConfirmationTextfield = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        Colors.orange[900],
        Colors.orange[800],
        Colors.orange[400]
      ])),
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsetsDirectional.only(top: 48.0, bottom: 16.0),
            child: Column(children: <Widget>[
              Text('Register',
                  style: TextStyle(
                      fontSize: 40.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: _montserratFontFamily)),
              Text('Start rocking today!',
                  style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                      fontFamily: _montserratFontFamily)),
            ]),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(top: 30.0, left: 30.0, right: 30.0),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0)),
              ),
              child: Column(children: <Widget>[
                NormalTextField(
                  label: "Name",
                  controller: _controllerDisplayName,
                  onChangeFoo: _validateDisplayName,
                  errorMessage: 'Please enter your name',
                  flag: _touchedDisplaynameTextfield && !_validationDisplayName,
                ),
                NormalTextField(
                  label: "Username",
                  controller: _controllerUsername,
                  errorMessage:
                      'Please enter a valid username, avoid \'@\' and spaces',
                  onChangeFoo: _validateUsername,
                  flag: _touchedUsernameTextfield && !_validationUsername,
                ),
                NormalTextField(
                  label: "Email",
                  controller: _controllerEmail,
                  onChangeFoo: _validateEmail,
                  errorMessage: 'Please enter a valid email',
                  flag: _touchedEmailTextfield && !_validationEmail,
                ),
                PasswordField(
                  label: "Password",
                  controller: _controllerPassword,
                  onChangeFoo: _validatePassword,
                  flag: _touchedPasswordTextfield && !_validationPassword,
                  errorMessage:
                      r'Password must have at least one capital letter, one lowercase letter, one number and one special character (! @ # $ % ^ & *)',
                ),
                PasswordField(
                  label: "Confirm Password",
                  controller: _controllerPasswordConfirmation,
                  onChangeFoo: _validatePasswordConfirmation,
                  errorMessage: 'Passwords are different',
                  flag: _touchedPasswordConfirmationTextfield &&
                      !_validationPasswordConfirmation,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      color: Colors.orangeAccent[700]),
                  child: FlatButton(
                      onPressed: _registerUser,
                      child: Text(
                        'REGISTER',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                            fontFamily: _montserratFontFamily),
                      )),
                ),
                Container(
                    margin: EdgeInsetsDirectional.only(top: 16.0),
                    child: RichText(
                        text: TextSpan(
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.grey[700],
                              fontFamily: 'Montserrat',
                            ),
                            children: <TextSpan>[
                          TextSpan(text: "Have an account? "),
                          TextSpan(
                              text: "Login",
                              style: TextStyle(
                                  color: Colors.orangeAccent[400],
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.pop(context);
                                })
                        ])))
              ]),
            ),
          )
        ],
      ),
    )));
  }
}
