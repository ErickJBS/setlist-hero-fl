import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:setlistherofl/routes.dart';
import 'package:setlistherofl/services/auth_service.dart';
import 'package:setlistherofl/service_locator.dart';
import 'widgets/event_viewer/index.dart';
import 'package:setlistherofl/utils/date_utils.dart';
import 'styles.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin{
  
  static AuthService _auth = locator<AuthService>();
  TabController _tabController;
  List<dynamic> menuOptions = <dynamic> [
    { 'label': 'Logout', 'callback': _logout },
  ];

  @override
  void initState(){
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  static Future<void> _logout(BuildContext context) async {
    try{
      await _auth.logout();
      Navigator.pushNamedAndRemoveUntil(context, loginRoute, (route) => false);
    } catch(e){
      print('Failed to signOut' + e.toString());
    }
  }

  void _onOptionSelected(dynamic option) async {
    var callback = option['callback'];
    await callback(context);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        title: Text('Setlist Hero',
          style: TextStyle(
            color: Colors.black87,
            fontFamily: 'Montserrat',
          ),
        ),
        actions: <Widget>[
          PopupMenuButton<dynamic>(
            icon: Icon(
              FontAwesomeIcons.ellipsisV,
              color: Colors.black87,
              size: 18,
            ),
            onSelected: _onOptionSelected,
            itemBuilder: (BuildContext context) {
              return menuOptions.map((option) {
                return PopupMenuItem<dynamic>(
                  value: option,
                  child: Text(option['label'])
                );
              }).toList();
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(left: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 10.0,),
            Text(
              'Events',
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'Montserrat',
                fontSize: 30,
              ),
            ),
            SizedBox(height: 10,),
            TabBar(
                controller: _tabController,
                indicatorColor: Colors.transparent,
                labelColor: tabLabelColor,
                isScrollable: true,
                labelPadding: EdgeInsets.only(right: 45.0),
                unselectedLabelColor: tabUnselectedLabelColor,
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
                child: TabBarView(
                    controller: _tabController,
                    children: [
                      EventViewer(
                        startDate: DateUtils.startOfCurrentDay(),
                        endDate: DateUtils.endOfCurrentDay(),
                      ),
                      EventViewer(
                        startDate: DateUtils.startOfCurrentDay(),
                        endDate: DateUtils.endOfCurrentMonth(),
                      ),
                      EventViewer(
                        startDate: DateUtils.startOfCurrentDay(),
                        endDate: DateUtils.endOfCurrentYear(),
                      ),
                    ]
                )
            )
          ],
        ),
      ),
    );
  }
}
