// import 'package:flutter/material.dart';
// import 'package:flutter/scheduler.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:setlistherofl/services/authentication.dart';

// // import '../../app.dart';
// // import '../../app_routes.dart';

// class SplashScreen extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {

//   @override
//   void initState() {
//     super.initState();
//     SchedulerBinding.instance.addPostFrameCallback((_) => _determineFirstPage(context));
//   }

//   void _determineFirstPage(context) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     if(prefs.containsKey('language')){
//       App.locale = Locale(prefs.getString('language'));
//     } else {
//       App.locale = Localizations.localeOf(context);
//     }
//     if(await UserService.instance.isSignedIn()) {
//       final user = await UserService.instance.getCurrentUser();
//       Navigator.of(context).pushNamedAndRemoveUntil(
//         HomeScreenRoute,
//         (Route<dynamic> route) => false,
//         arguments: user
//       );
//     } else {
//       await UserService.instance.signOut(); // Removes saved user if token expired
//       Navigator.of(context).pushNamedAndRemoveUntil(LoginScreenRoute, (Route<dynamic> route) => false);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Padding(
//           padding: EdgeInsets.all(48.0),
//           child: Image.asset('assets/images/logo_vt_flat.png'),
//         ),
//       ),
//     );
//   }
// }