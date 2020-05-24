import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:setlistherofl/screens/home/event_screen.dart';
class EventPage extends StatefulWidget {
  @override
  _EventPageState createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          SizedBox(height: 15),
          Container(
            padding: EdgeInsets.only(right: 15),
            width: MediaQuery.of(context).size.width - 30,
            height: MediaQuery.of(context).size.height - 50,
            child: GridView.count(
              crossAxisCount: 2,
              primary: false,
              crossAxisSpacing: 10,
              mainAxisSpacing: 15,
              childAspectRatio: 0.8,
              children: <Widget>[
                _buildCard('One More Light Tour', 'May 25th', 'Linkin Park', 'assets/images/Linkin Park (2).png', context),
                _buildCard('Nostalgia Tour', 'May 25th', 'Dua Lipa', 'assets/images/Dua LipaE.png', context),
                _buildCard('Laughter Tour', 'May 25th', 'Paramore', 'assets/images/Paramore2.png', context),
                _buildCard('Bandito Tour', 'May 25th', 'Twenty One Pilots', 'assets/images/Twenty One Pilots2.png', context),
              ],
            ),
          ),
          SizedBox(height: 15,)
        ],
    ),
    );
  }

  Widget _buildCard(String tourName, String date, String band, String imgPath, context){
    return Padding(
      padding: EdgeInsets.only(top: 5, bottom: 5, left: 5, right: 5),
      child: InkWell(
        onTap: (){
          Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => EventoSets(
                  assetPath: imgPath,
                  date: date,
                  tourName: tourName,
                  nameBand: band,
                ),
              ),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 3,
                blurRadius: 5,
              ),
            ],
            color: Colors.white,
          ),
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(10),
              ),
              Hero(
                tag: imgPath,
                child: Container(
                  height: 110,
                  width: 110,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage(imgPath),
                        fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 7),
              Text(band,
                style: TextStyle(
                  color: Colors.black87,
                  fontFamily: 'Montserrat',
                  fontSize: 14,
                ),
              ),
              Text(tourName,
                style: TextStyle(
                  color: Colors.black87,
                  fontFamily: 'Montserrat',
                  fontSize: 10,
                ),
              ),
              Text(date,
                style: TextStyle(
                  color: Colors.black87,
                  fontFamily: 'Montserrat',
                  fontSize: 10,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
