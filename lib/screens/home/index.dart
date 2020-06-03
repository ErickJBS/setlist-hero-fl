import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:setlistherofl/routes.dart';
import 'package:setlistherofl/services/auth_service.dart';
import 'package:setlistherofl/service_locator.dart';
import 'widgets/event_viewer/index.dart';
import 'styles.dart';
import 'package:provider/provider.dart' as prov;
import 'package:setlistherofl/AppStateNotifier.dart';
import 'package:setlistherofl/screens/settings/index.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  static AuthService _auth = locator<AuthService>();
  TabController _tabController;
//  List<dynamic> menuOptions = <dynamic>[
//    {'label': 'Logout', 'callback': _logout},
//  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).appBarTheme.color,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          'Setlist Hero',
          style: Theme.of(context).textTheme.headline6,
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.settings,
                color: Theme.of(context).iconTheme.color,
                size: 18,
              ),
              onPressed: () {
                //Navigate to Settings screen
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => Settings()
                ));
              },
            ),

        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(left: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 10.0,
            ),
            Text(
              'Events',
              style: Theme.of(context).textTheme.bodyText1,
            ),
            SizedBox(
              height: 10,
            ),
            TabBar(
                controller: _tabController,
                indicatorColor: Colors.transparent,
                labelColor: Theme.of(context).tabBarTheme.labelColor,
                isScrollable: true,
                labelPadding: EdgeInsets.only(right: 45.0),
                unselectedLabelColor:
                    Theme.of(context).tabBarTheme.unselectedLabelColor,
                tabs: [
                  Tab(
                    child: Text(
                      'Today',
                      style: TabLabelStyle,
                    ),
                  ),
                  Tab(
                    child: Text(
                      'This Month',
                      style: TabLabelStyle,
                    ),
                  ),
                  Tab(
                    child: Text(
                      'This Year',
                      style: TabLabelStyle,
                    ),
                  )
                ]),
            Container(
                height: MediaQuery.of(context).size.height - 50,
                width: double.infinity,
                child: TabBarView(controller: _tabController, children: [
                  EventViewer(),
                  EventViewer(),
                  EventViewer(),
                ]))
          ],
        ),
      ),
    );
  }
}
