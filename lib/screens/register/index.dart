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
  var _controllers = List<TextEditingController>(5);
  var _validations = List<bool>(5);

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
                  errorText: 'Please enter a valid username, avoid @ and spaces',
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
                  errorText: r'Password must have at least one capital letter, one lowercase letter, one number and one special character (! @ # $ % ^ & *)',
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
                      onPressed: () {
                        bool registrationOk = true;

                        for (int i = 0;
                            registrationOk && i < _validations.length;
                            i++) {
                          registrationOk = _validations[i];
                        }

                        if (registrationOk) {
                          print('REGISTRADO');
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
                )
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
