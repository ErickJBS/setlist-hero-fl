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
  //final _formKey = GlobalKey<FormState>();
  var _controllers = List<TextEditingController>(5);
  var _validations = List<bool>(5);
  final AuthService _auth = locator<AuthService>();

  @override
  void dispose() {
    for (TextEditingController controller in _controllers) {
      if (controller != null) {
        controller.dispose();
      }
    }
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    for (int i = 0; i < _validations.length; i++) {
      _validations[i] = false;
    }

    for (int i = 0; i < _controllers.length; i++) {
      _controllers[i] = TextEditingController();
    }
  }

  void _validateEmail(String s) {
    RegExp regExp = RegExp(
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");

    _validations[2] = regExp.hasMatch(s.trim());
    print(_validations[2]);
  }

  void _validateName(String s) {
    _validations[0] = s.isNotEmpty;
    print(_validations[0]);
  }

  void _validateUsername(String s) {
    String s1 = s.trim();
    _validations[1] = !(s1.contains('@') || s1.contains(' '));
    print(_validations[1]);
  }

  void _validatePassword(String s) {
    _validations[3] = s.length >= 8 &&
        s.contains(RegExp(r'[A-Z]')) &&
        s.contains(RegExp(r'[a-z]')) &&
        s.contains(RegExp(r'[0-9]')) &&
        s.contains(RegExp(r'[!@#$%^&*.]'));
    print(_validations[3]);
  }

  void _validatePasswordConfirmation(String s) {
    _validations[4] = s == _controllers[3].text;
    print(_validations[4]);
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
                  controller: _controllers[0],
                  onChangeFoo: _validateName,
                  errorText: 'Please enter your name',
                  flag: _validations[0],
                ),
                NormalTextField(
                  label: "Username",
                  controller: _controllers[1],
                  errorText:
                      'Please enter a valid username, avoid @ and spaces',
                  onChangeFoo: _validateUsername,
                ),
                NormalTextField(
                  label: "Email",
                  controller: _controllers[2],
                  onChangeFoo: _validateEmail,
                  errorText: 'Please enter a valid email',
                ),
                PasswordField(
                  label: "Password",
                  controller: _controllers[3],
                  onChangeFoo: _validatePassword,
                  errorText:
                      r'Password must have at least one capital letter, one lowercase letter, one number and one special character (! @ # $ % ^ & *)',
                ),
                PasswordField(
                  label: "Confirm Password",
                  controller: _controllers[4],
                  onChangeFoo: _validatePasswordConfirmation,
                  errorText: 'Passwords are different',
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      color: Colors.orangeAccent[700]),
                  child: FlatButton(
                      onPressed: () async {
                        bool registrationOk = true;

                        for (int i = 0;
                            registrationOk && i < _validations.length;
                            i++) {
                          registrationOk = _validations[i];
                        }

                        if (registrationOk) {
                          dynamic result = await _auth.register(
                              email: _controllers[2].text.toString(),
                              username: _controllers[1].text.toString(),
                              password: _controllers[3].text.toString(),
                              displayName: _controllers[0].text.toString());
                          if (result == null) {
                            print("NO SE PUDO REGISTRAR");
                          } else {
                            Navigator.popAndPushNamed(context, homeRoute);
                          }
                        } else {
                          print('No registrasdo :C');
                        }
                      },
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
