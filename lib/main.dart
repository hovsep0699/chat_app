// import 'dart:html' as html;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(),
    );
  }
}
//
// class HomeScreen extends StatefulWidget {
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//   @override
//   void initState() {
//     super.initState();
//     if (kIsWeb) {
//       html.window.onBeforeUnload.listen((event) {
//         html.window.localStorage['log'] = "exited";
//         event.preventDefault(); // Prevent auto-closing
//         // _showExitDialog(context);
//         // event.returnValue = 'Are you sure you want to leave?'; // Show message
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: () async {
//         return await _showExitDialog(context);
//       },
//       child: Scaffold(
//         appBar: AppBar(title: Text('Exit Confirmation')),
//         body: Center(child: Text('Press back or close the tab to test.')),
//       ),
//     );
//   }
//
//   Future<bool> _showExitDialog(BuildContext context) async {
//     return await showDialog(
//       context: context,
//       barrierDismissible: false,
//       builder: (context) => AlertDialog(
//         title: Text("Exit App"),
//         content: Text("Are you sure you want to exit?"),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.of(context).pop(false),
//             child: Text("Cancel"),
//           ),
//           TextButton(
//             onPressed: () => Navigator.of(context).pop(true),
//             child: Text("Exit"),
//           ),
//         ],
//       ),
//     ) ??
//         false;
//   }
// }


