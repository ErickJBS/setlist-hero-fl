import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:setlistherofl/models/event.dart';
import 'package:setlistherofl/services/event_service.dart';
import 'package:setlistherofl/services/auth_service.dart';
import 'package:setlistherofl/service_locator.dart';
import '../event_item/index.dart';

class EventViewer extends StatefulWidget {
  final DateTime startDate;
  final DateTime endDate;
  EventViewer({this.startDate, this.endDate});

  @override
  _EventViewerState createState() => _EventViewerState();
}

class _EventViewerState extends State<EventViewer> {
  EventService eventService = locator<EventService>();
  AuthService authService = locator<AuthService>();
  List<Event> _events = List<Event>();
  bool _isLoading;

  @override
  void initState() {
    super.initState();
    _isLoading = true;
    _loadEvents();
  }

  void _loadEvents() async {
    var user = await authService.getCurrentUser();
    EventFilter filter = EventFilter(
      musician: user.id,
      startDate: widget.startDate.toString(),
      endDate: widget.endDate.toString()
    );
    List<Event> events = await eventService.findByFilter(filter);
    try {
    setState(() {
      _events = events;
      _isLoading = false;
    });
    } catch (e) {
      
    }
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Center(
        child: _isLoading ?
          CircularProgressIndicator() :
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(height: 10.0),
              Expanded(
                child: ListView.builder(
                  itemCount: _events.length,
                  itemBuilder: (context, index) => EventItem(_events[index]),
                ),
              ),
            ],
          ),
      ),
    );
  }
}
