import 'package:flutter/material.dart';
import 'package:setlistherofl/models/event.dart';
import 'package:intl/intl.dart';
import 'package:setlistherofl/screens/setlist/index.dart';

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
            color: Theme.of(context).backgroundColor,
            elevation: 14,
            borderRadius: BorderRadius.circular(5),
            shadowColor: Theme.of(context).cardTheme.shadowColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.all(10)
                ),
                SizedBox(height: 5),
                Text(event.bandName ?? '',
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                Text(event.tour ?? '',
                  style: Theme.of(context).textTheme.subtitle2,
                ),
                Text(_formatedDate ?? '',
                  style: Theme.of(context).textTheme.subtitle2,
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
