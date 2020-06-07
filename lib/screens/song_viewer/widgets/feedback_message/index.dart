import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:setlistherofl/screens/song_viewer/widgets/feedback_message/styles.dart';

class FeedbackMessage extends StatelessWidget {
  final icon;
  final message;

  FeedbackMessage({this.icon, this.message});

  @override
  Widget build(BuildContext context) {
   return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 0.0),
        child: Card(
          color: Theme.of(context).backgroundColor,
          shadowColor: Theme.of(context).cardTheme.shadowColor,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    icon,
                    color: Theme.of(context).textTheme.bodyText1.color,
                    size: feedbackIconSize,
                  ),
                  Text(
                    message,
                    style: Theme.of(context).textTheme.subtitle2,
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
