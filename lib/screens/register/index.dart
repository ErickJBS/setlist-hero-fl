import 'package:flutter/material.dart';
import 'package:setlistherofl/screens/register/widgets/normalTextField/index.dart';
import 'package:setlistherofl/screens/register/widgets/passwordField/index.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({Key key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

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
          top: 32.0,
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Column(children: <Widget>[
              Container(
                //height: 100.0,
                child: Text("data")//Image.asset('lib/assets/images/logo.png'),
              ),
              Text('Start rocking today!',
                  style: TextStyle(
                      fontSize: 24.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold)),
            ]),
          ),
        ),
        Positioned(
          top: 280.0,
          child: Container(
            height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 32.0),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16.0),
                  topRight: Radius.circular(16.0)),
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
                Center(
                    child: FlatButton(
                  onPressed: () {
                    print('Sign Up');
                  },
                  child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 32.0, vertical: 28.0),
                      child: Text(
                        'REGISTER',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16.0),
                      )),
                  color: Colors.orange,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0)),
                ))
              ],
            ),
          ),
        ),
      ]),
    );
    /*
        Container(
          height: MediaQuery.of(context).size.height * 0.6,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("lib/assets/images/dua_lipa.jpg"),
                    fit: BoxFit.cover)),
            child: Column(
              children: <Widget>[
                Container(
                    height: 100.0,
                    child: Image.asset("lib/assets/images/dua_lipa.jpg")),
                Text('Sign Up', style: Theme.of(context).textTheme.headline2),
                Text(
                  'to star rocking',
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                Container(child: Material(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.0),
                            topRight: Radius.circular(20.0))),
                    child: Form(
                        key: _formKey,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              NormalTextField(label: 'Your name'),
                              NormalTextField(label: 'Email'),
                              NormalTextField(label: 'Username'),
                              PasswordField(label: 'Password'),
                              PasswordField(label: 'Confirm your password'),
                              Center(
                                  child: FlatButton(
                                onPressed: () {
                                  print('Sign Up');
                                },
                                child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 32.0, vertical: 8.0),
                                    child: Text(
                                      'SIGN UP',
                                      style: Theme.of(context).textTheme.button,
                                    )),
                                color: Colors.orange,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50.0)),
                              )),
                            ],
                          ),
                        ))),
              ],
            )));

    // return Scaffold(
    //     appBar: AppBar(
    //       title: Text('Sign Up'),
    //     ),
    //     body: Container(
    //         decoration: BoxDecoration(
    //             image: DecorationImage(
    //                 image: AssetImage("lib/assets/images/dua_lipa.jpg"),
    //                 fit: BoxFit.cover)),
    //         child: Material(
    //             shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0))),
    //             child: Form(
    //                 key: _formKey,
    //                 child: Padding(
    //                   padding: const EdgeInsets.symmetric(horizontal: 16.0),
    //                   child: Column(
    //                     crossAxisAlignment: CrossAxisAlignment.start,
    //                     children: <Widget>[
    //                       NormalTextField(label: 'Your name'),
    //                       NormalTextField(label: 'Email'),
    //                       NormalTextField(label: 'Username'),
    //                       PasswordField(label: 'Password'),
    //                       PasswordField(label: 'Confirm your password'),
    //                       Center(
    //                           child: FlatButton(
    //                               onPressed: () {
    //                                 print('Sign Up');
    //                               },
    //                               child: Padding(
    //                                 padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 8.0),
    //                                 child: Text(
    //                                   'SIGN UP',
    //                                   style: TextStyle(fontSize: 32.0),
    //                                 )),
    //                                 color: Colors.orange,
    //                                 shape: RoundedRectangleBorder(
    //                                     borderRadius:
    //                                         BorderRadius.circular(50.0)),
    //                               )),
    //                     ],
    //                   ),
    //                 )))));
  }
}*/
  }
}
