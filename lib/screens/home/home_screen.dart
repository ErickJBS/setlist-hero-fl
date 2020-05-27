import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:setlistherofl/screens/home/Event_page.dart';
import 'package:setlistherofl/screens/home/Event_page2Month.dart';
import 'package:setlistherofl/screens/home/Event_page3Year.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin{
  TabController _tabController;

  @override
  void initState(){
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
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
          IconButton(
            icon: Icon(
              FontAwesomeIcons.ellipsisV,
              color: Colors.black87,
            ),
            onPressed: (){},
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.only(left: 20.0),
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
    );
  }
}
