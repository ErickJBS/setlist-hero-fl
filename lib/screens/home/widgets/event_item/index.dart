import 'package:flutter/material.dart';
import 'package:setlistherofl/models/event.dart';
import 'package:intl/intl.dart';
import 'package:setlistherofl/screens/setlist/index.dart';
import 'styles.dart';

class EventItem extends StatelessWidget {
  static DateFormat formatter = new DateFormat('yyyy-MM-dd');
  final Event event;

  EventItem(this.event);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SetlistScreen(event),
          ),
        );
      },
      child: Container(
        child: Card(
          margin: EdgeInsets.fromLTRB(16, 5, 16, 5),
          child: Material(
            color: Colors.white,
            elevation: 14,
            borderRadius: BorderRadius.circular(5),
            shadowColor: Colors.grey.withOpacity(.5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.all(10)
                ),
                SizedBox(height: 5),
                Text(event.bandName ?? '',
                  style: EventTextStyle,
                ),
                Text(event.tour ?? '',
                  style: EventTextStyle,
                ),
                Text(_formatedDate ?? '',
                  style: EventTextStyle,
                ),
                SizedBox(height: 20),
                Divider(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String get _formatedDate {
    if (event.date != null)
      return formatter.format(event.date);
    return null;
  }
  
}
