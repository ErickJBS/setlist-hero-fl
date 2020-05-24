import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class BottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      notchMargin: 6,
      color: Colors.transparent,
      elevation: 9,
      clipBehavior: Clip.antiAlias,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
            color: Colors.white
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Icon(Icons.home, color: Colors.orange,),
                  Icon(Icons.person_outline, color: Colors.grey[400]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
