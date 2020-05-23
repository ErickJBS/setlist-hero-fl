import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:setlistherofl/routes.dart';
import 'package:setlistherofl/screens/home/index.dart';
import 'package:setlistherofl/screens/register/index.dart';
import 'package:setlistherofl/services/auth_service.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final AuthService _auth = AuthService();
  final _containerKey = GlobalKey<FormState>();

  //Text field state
  String email = '';
  String password = '';
  String error = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(
          //title: Text('login screen'),
      //),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.orange[900],
              Colors.orange[800],
              Colors.orange[400],
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
                  Text('Welcome', style: TextStyle(color: Colors.white, fontFamily: 'Montserrat',fontSize: 40),),
                  SizedBox(height: 10,), // Separador de palabras
                  Text("Let's rock!", style: TextStyle(color: Colors.white, fontFamily: 'Montserrat', fontSize: 20),),
                ],
              ),
            ),
            SizedBox(height: 15,), //separación del texto con el contenedor balnco
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))
                ),
                child: Padding(
                  key: _containerKey,
                  padding: EdgeInsets.all(30),
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 15,),
                      Padding(
                          padding: const EdgeInsets.only(bottom: 16.0),
                          child: TextFormField(
                            //validator: (val) => val.isEmpty ? 'Enter email' : null,
                              //controller: controller,
                              onChanged: (val){
                                  setState(() {
                                    email = val;
                                  });
                              },
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Email',
                                  //errorText: null,
                                  labelStyle: TextStyle(
                                    fontFamily: 'Montserrat',
                                  ),
                              ),
                          ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: TextFormField(
                          //validator: (val) => val.isEmpty ? 'Enter password' : null,
                          //controller: controller,
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
                            labelStyle: TextStyle(
                              fontFamily: 'Montserrat',
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20,),  // separador para botn login
                      Container(
                        //height: 40,
                        //padding: EdgeInsets.all(10),
                        //margin: EdgeInsets.symmetric(horizontal: 10),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(5), topRight: Radius.circular(5), bottomLeft: Radius.circular(5), bottomRight: Radius.circular(5)),
                          color: Colors.orangeAccent[700]
                        ),
                        child: FlatButton(
                          onPressed: () async{
                            dynamic result = await _auth.loginWithPassword(email, password);
                            if (result == null){
                              setState(() {
                                error = 'Wrong email or password';
                              });
                            }else{
                              Navigator.popAndPushNamed(
                                context, homeRoute);
                            }
                          },
                          child: Text(
                            'LOGIN',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Montserrat',
                                fontSize: 20),
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
                        style: TextStyle(
                          color: Colors.grey[700],
                          fontFamily: 'Montserrat',
                        ),
                      ),
                      SizedBox(height: 20,),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: Container(
                              //height: 40,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(topLeft: Radius.circular(5), topRight: Radius.circular(5), bottomLeft: Radius.circular(5), bottomRight: Radius.circular(5)),
                                color: Color.fromARGB(255, 59, 89, 152)
                              ),
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    FlatButton(
                                      onPressed: () {
                                        print('Facebook signed in');
                                      },
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
                          SizedBox(width: 40,),  // separador para botones redes sociales
                          Expanded(
                            child: Container(
                              //height: 40,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(topLeft: Radius.circular(5), topRight: Radius.circular(5), bottomLeft: Radius.circular(5), bottomRight: Radius.circular(5)),
                                  color: Colors.deepOrange,
                              ),
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    FlatButton(
                                      onPressed: () {
                                        print('Google signed in');
                                      },
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
                            style: TextStyle(
                                color: Colors.grey[700],
                                fontFamily: 'Montserrat',
                            ),
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
                                color: Colors.orangeAccent[400],
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
            )
          ],
        ),
      ),
    );
  }
}