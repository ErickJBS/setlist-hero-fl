import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart' as prov;
import 'package:setlistherofl/app_state_notifier.dart';
import 'package:setlistherofl/services/auth_service.dart';
import 'package:setlistherofl/service_locator.dart';
import 'package:setlistherofl/routes.dart';

class SettingsScreen extends StatelessWidget {
  static AuthService _auth = locator<AuthService>();

  static Future<void> _logout(BuildContext context) async {
    try {
      await _auth.logout();
      Navigator.pushNamedAndRemoveUntil(context, loginRoute, (route) => false);
    } catch (e) {
      print('Failed to signOut' + e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Settings',
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          SizedBox(height: 10.0),
          Expanded(
            child: Card(
              child: Material(
                color: Theme.of(context).scaffoldBackgroundColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Row(
                        children: <Widget>[
                          Text(
                            'Dark Theme',
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                          Spacer(
                            flex: 1,
                          ),
                          Switch(
                            value: prov.Provider.of<AppStateNotifier>(context,
                                    listen: false)
                                .darkTheme,
                            onChanged: (boolVal) {
                              prov.Provider.of<AppStateNotifier>(context,
                                      listen: false)
                                  .updateTheme();
                            },
                          ),
                        ],
                      ),
                    ),
                    Divider(),
                    Row(
                      children: <Widget>[
                        Padding(padding: EdgeInsets.all(5)),
                        SizedBox(height: 10),
                        RaisedButton(
                          color: Theme.of(context).buttonColor,
                          onPressed: () {
                            _logout(context);
                          },
                          child: Text(
                            'LOGOUT',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Divider(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
