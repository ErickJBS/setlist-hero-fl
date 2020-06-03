import 'package:flutter/material.dart';



class ThemeBuilder {
  ThemeBuilder._();

  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    backgroundColor: Colors.white,

    appBarTheme: AppBarTheme(
      color: Colors.white,      //App bar color
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
    ),
    textTheme: TextTheme(
      headline6: TextStyle( //Appbar titles
        color: Colors.black87,
        fontFamily: 'Montserrat',
      ),
      headline5: TextStyle(  //login button title
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontFamily: 'Montserrat',
          fontSize: 20),
      headline4: TextStyle(  //Email & password TextStyle
        fontFamily: 'Montserrat',
        color: Colors.grey,
        fontSize: 12,
      ),
      headline3: TextStyle(  //Setlist title (tour Name) (when oppening an event)
        fontFamily: 'Montserrat',
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
        color: Color.fromARGB(255, 26, 62, 147),
      ),
      headline2: TextStyle(  //Setlist Subtitle(band) (when oppening an event)
        fontFamily: 'Montserrat',
        fontSize: 15.0,
        fontWeight: FontWeight.bold,
        color: Color.fromARGB(255, 26, 62, 147),
      ),
      headline1: TextStyle(  //Setlist Subtitle(date) (when oppening an event)
        fontFamily: 'Montserrat',
        fontSize: 12.0,
        fontWeight: FontWeight.bold,
        color: Color.fromARGB(255, 26, 62, 147),
      ),
      bodyText1: TextStyle(  //title 'Events' - dashboard
        color: Colors.black,
        fontFamily: 'Montserrat',
        fontSize: 30,
      ),
      bodyText2: TextStyle(  //Band title - dashboard
        color: Colors.black,
        fontFamily: 'Montserrat',
        fontSize: 16,
      ),
      subtitle2: TextStyle( //Tour name and date - dashboard-
        color: Colors.black,
        fontFamily: 'Montserrat',
        fontSize: 12,
      ),
    ),
    cardTheme: CardTheme( //Card theme - dashboard
      color: Colors.white,
      shadowColor: Colors.grey[400].withOpacity(.6),
    ),
    iconTheme: IconThemeData(
      color: Colors.grey,
    ),
    tabBarTheme: TabBarTheme(    //Tab bar theme for Today's events, This Month and This Yearl
      labelColor: Color.fromARGB(255, 26, 62, 147),
      unselectedLabelColor: Colors.grey[400],
    ),
    buttonColor:  Color.fromARGB(255, 26, 62, 147), //Logout button
  );


  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.grey[900],
    backgroundColor: Colors.grey[800],

    appBarTheme: AppBarTheme(  //App bar color
      color: Colors.grey[900],
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
    ),
    textTheme: TextTheme(
      headline6: TextStyle( //Appbar titles
        color: Colors.white,
        fontFamily: 'Montserrat',
      ),
      headline5: TextStyle(  //login button title
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontFamily: 'Montserrat',
          fontSize: 20),
      headline4: TextStyle(  //Email & password TextStyle
        fontFamily: 'Montserrat',
        color: Colors.grey[50],
      ),
      headline3: TextStyle(  //Setlist title (tour Name) (when oppening an event)
        fontFamily: 'Montserrat',
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
        color: Color(0xFFF17532),
      ),
      headline2: TextStyle(  //Setlist Subtitle(band) (when oppening an event)
        fontFamily: 'Montserrat',
        fontSize: 15.0,
        fontWeight: FontWeight.bold,
        color: Color(0xFFF17532),
      ),
      headline1: TextStyle(  //Setlist Subtitle(date) (when oppening an event)
        fontFamily: 'Montserrat',
        fontSize: 12.0,
        fontWeight: FontWeight.bold,
        color: Color(0xFFF17532),
      ),
      bodyText1: TextStyle( //title 'Events' - dashboard
        color: Colors.white,
        fontFamily: 'Montserrat',
        fontSize: 30,
      ),
      bodyText2: TextStyle( //Band title - dashboard
        color: Colors.white,
        fontFamily: 'Montserrat',
        fontSize: 16,
      ),
      subtitle2: TextStyle( //Tour name and date - dashboard-
        color: Colors.white,
        fontFamily: 'Montserrat',
        fontSize: 12,
      ),
    ),
    cardTheme: CardTheme( //Card theme - dashboard
      color: Colors.blueGrey[600],
      shadowColor: Colors.grey[700].withOpacity(.8),
    ),
    iconTheme: IconThemeData(
      color: Colors.grey,
    ),
    tabBarTheme: TabBarTheme( //Tab bar theme for Today's events, This Month and This Yearl
      labelColor: Colors.orange[400],
      unselectedLabelColor: Colors.grey[400],
    ),
    buttonColor:  Color.fromARGB(255, 80, 101, 149),  //Logout button
  );
}
