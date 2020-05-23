import 'package:flutter/material.dart';
import 'package:setlistherofl/screens/login/index.dart';
import 'package:setlistherofl/screens/register/index.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('/assets/images/Twenty One Pilots2.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Colors.black.withOpacity(.3),
                  Colors.black.withOpacity(.3),
                ]),
              ),
              child: Padding(
                padding: EdgeInsets.all(30),
                child: Center(
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          height: 40,
                          child: RaisedButton(
                            color: Colors.orangeAccent,
                            child: Text(
                              'LOGIN',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Montserrat',
                                  fontSize: 18),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginScreen()),
                              );
                            },
                          ),
                        ),
                      ),
                      SizedBox(width: 40,),
                      Expanded(
                        child: Container(
                          height: 40,
                          child: RaisedButton(
                            color: Colors.deepOrange,
                            child: Text(
                              'SIGNUP',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Montserrat',
                                  fontSize: 18),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => RegisterScreen()),
                              );
                            },
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
