import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:setlistherofl/routes.dart';
import 'package:setlistherofl/screens/home/Event_page.dart';
import 'package:setlistherofl/screens/home/Event_page2Month.dart';
import 'package:setlistherofl/screens/home/Event_page3Year.dart';
import 'package:setlistherofl/services/auth_service.dart';
import 'package:setlistherofl/service_locator.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}



class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin{
  TabController _tabController;
  static const String logout = 'logout';
  final AuthService _auth = locator<AuthService>();
  static const List<String> choices = <String>[  //En caso de que en el futuro haya más opciones
    logout,
  ];
  @override
  void initState(){
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  Future<void> _logout() async{
    try{
      await _auth.logout();
    } catch(e){
      print('Failed to signOut' + e.toString());
    }
  }

  void _choiceAction(String choice) async{
    if(choice == _HomeScreenState.logout) {
      await _logout();
      Navigator.pushNamedAndRemoveUntil(context, loginRoute, (Route route) => false);
    }//Aquí habría un elseif en dado caso que en el futuro agreguemos más opciones, como help, settings, etc
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
          PopupMenuButton<String>(
            icon: Icon(
              FontAwesomeIcons.ellipsisV,
              color: Colors.black87,
              size: 18,
            ),
            onSelected: _choiceAction,
            itemBuilder: (BuildContext context){
              return _HomeScreenState.choices.map((String choice){
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
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
                labelColor: Colors.orange[400],
                isScrollable: true,
                labelPadding: EdgeInsets.only(right: 45.0),
                unselectedLabelColor: Colors.grey[400],
                tabs: [
                  Tab(
                    child: Text(
                      'Current Events',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 21,
                      ),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'This Month',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 21,
                      ),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'This Year',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 21,
                      ),
                    ),
                  )
                ]),
            Container(
                height: MediaQuery.of(context).size.height - 50,
                width: double.infinity,
                child: TabBarView(
                    controller: _tabController,
                    children: [
                      EventPage(),
                      EventPageMonth(),
                      EventPageYear(),
                    ]
                )
            )
          ],
        ),
      ),
    );
  }
}
