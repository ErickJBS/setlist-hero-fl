import 'package:flutter/material.dart';
import 'package:setlistherofl/models/event.dart';
import './widgets/expandable_item/index.dart';
import 'package:setlistherofl/services/event_service.dart';
import 'package:setlistherofl/service_locator.dart';

class SetlistScreen extends StatefulWidget {
  final Event event;

  SetlistScreen(this.event);

  @override
  State<SetlistScreen> createState() => _SetlistScreenState();
}

class _SetlistScreenState extends State<SetlistScreen> {
  EventService _eventService = locator<EventService>();
  bool _isLoading;
  Event _event;

  @override
  void initState() {
    super.initState();
    _loadEvent();
    _isLoading = true;
  }

  void _loadEvent() {
    _eventService.findById(widget.event.id).then((event) {
      setState(() {
        _isLoading = false;
        _event = event;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Colors.black87,
        ),
        title: Text(
          widget.event.name,
          style: TextStyle(
            color: Colors.black87,
            fontFamily: 'Montserrat',
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(8.0),
        child: _isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                children: <Widget>[
                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: _event.setlist.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ExpandableItem(
                          title: _event.setlist[index].name ?? '',
                          songs: _event.setlist[index].songs);
                    },
                  ),
                ],
              ),
      ),
    );
  }
}
