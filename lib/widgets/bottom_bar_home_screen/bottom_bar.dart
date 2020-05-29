import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:setlistherofl/screens/home/index.dart';
import 'package:setlistherofl/screens/profile/profile_page.dart';

class BottomBar extends StatefulWidget {
  //final int indexTap;

  //BottomBar({this.indexTap});
  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectedIndexItem = 0;
  final List<Widget> _children = [
    HomeScreen(),
    Profile_Page(),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_selectedIndexItem],
      bottomNavigationBar: Row(
        children: <Widget>[
         buildNavigationBarItems(Icons.home, 0),
          buildNavigationBarItems(Icons.person_outline, 1),
        ],
      ),
    );
  }

  Widget buildNavigationBarItems(IconData icon, int index){

    return GestureDetector(
      onTap: (){
        setState(() {
          _selectedIndexItem = index;
        });
      },
      child: Container(
        height: 50,
        width: MediaQuery.of(context).size.width/2,
        decoration: index == _selectedIndexItem ? BoxDecoration(
          border: Border(
            bottom: BorderSide(width: 4, color: Colors.orange)
          ),
          gradient: LinearGradient(colors: [
            Colors.orange.withOpacity(0.3),
            Colors.orange.withOpacity(0.015),
          ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
          //color: index == _selectedIndexItem ? Colors.orange : Colors.white,
        ) : BoxDecoration(),
        child: Icon(
          icon,
          color: index == _selectedIndexItem ? Colors.black : Colors.grey[400],
        ),
      ),
    );
  }
}


