import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:setlistherofl/routes.dart';
import 'package:setlistherofl/screens/register/index.dart';
import 'package:setlistherofl/services/auth_service.dart';
import 'package:setlistherofl/service_locator.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final AuthService _auth = locator<AuthService>();
  final _containerKey = GlobalKey<FormState>();
  //Text field state
  String email = '';
  String password = '';
  String error = '';

  void _loginWithSocialMedia(Provider provider) async {
    final user = await _auth.loginWithSocial(provider);
    if (user != null) {
      print(user.email);
      Navigator.popAndPushNamed(context, homeRoute);
    } else {
      setState(() {
        error = 'An error happened using social media login. Please Try again';
      });
    }
  }

  void _loginWithEmailPassword (email, password) async{
    dynamic result = await _auth.loginWithPassword(email, password);
    if (result == null){
      setState(() {
        error = 'Wrong email or password';
      });
    }else{
      Navigator.popAndPushNamed(
          context, homeRoute);
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(220, 26, 62, 147),
              Color.fromARGB(230, 80, 101, 149),
              Color.fromARGB(200, 156, 175, 219),
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 30,),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Welcome',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Montserrat',
                      fontSize: 40),
                  ),
                  SizedBox(height: 10,), // Separador de palabras
                  Text("Let's rock!",
                    style: TextStyle(
                        color: Colors.white,
                      fontFamily: 'Montserrat',
                      fontSize: 20),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15,), //Divider for the text with the white container
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).backgroundColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                  ),
                ),
                child: Padding(
                  key: _containerKey,
                  padding: EdgeInsets.all(30),
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 15,),
                        Padding(
                            padding: const EdgeInsets.only(bottom: 16.0),
                            child: TextFormField(
                                onChanged: (val){
                                    setState(() {
                                      email = val;
                                    });
                                },
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Email',
                                    labelStyle: Theme.of(context).textTheme.bodyText2,
                                ),
                            ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 16.0),
                          child: TextFormField(
                            obscureText: true,
                            onChanged: (val){
                              setState(() {
                                password = val;
                              });
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Password',
                              //errorText: null,
                              labelStyle: Theme.of(context).textTheme.bodyText2,
                            ),
                          ),
                        ),
                        SizedBox(height: 20,),  // Divider for login button
                        Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(5),
                            ),
                            color: Color.fromARGB(255, 80, 101, 149),
                          ),
                          child: FlatButton(
                            onPressed: () => _loginWithEmailPassword(email, password),
                            child: Text(
                              'LOGIN',
                              style: Theme.of(context).textTheme.headline5
                            ),
                          ),
                        ),
                        SizedBox(height: 10,),
                        Text(error,
                          style: TextStyle(
                            color: Colors.red,
                            fontFamily: 'Montserrat',
                          ),
                        ),
                        SizedBox(height: 20,),
                        Text('Continue with social media',
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                        SizedBox(height: 20,),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(5),
                                    ),
                                  color: Color.fromARGB(255, 59, 89, 152)
                                ),
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      FlatButton(
                                        onPressed: () => _loginWithSocialMedia(Provider.FACEBOOK),
                                        child: Icon(
                                          FontAwesomeIcons.facebook,
                                          color: Colors.white,
                                          size: 28,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 40,),  //divider for the Social media Buttons
                            Expanded(
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(5),
                                    ),
                                    color: Colors.deepOrange,
                                ),
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      FlatButton(
                                        onPressed: () => _loginWithSocialMedia(Provider.GOOGLE),
                                        child: Icon(
                                          FontAwesomeIcons.google,
                                          color: Colors.white,
                                          size: 28,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 60,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Don't have an account? ",
                              style: Theme.of(context).textTheme.bodyText2,
                            ),
                            SizedBox(height: 5,),
                            InkWell(
                              onTap: (){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => RegisterScreen()),
                                );
                              },
                              child: Text('Register',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 156, 175, 219),
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}