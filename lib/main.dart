import 'package:flutter/material.dart';
import 'package:flutter_netflix_responsive_ui/screens/screens.dart';

// Todo - THINGS I LEARNED FROM THIS
// 1) Responsive, dynamic design - View Widgets/responsive and
// 2) Video Player - Used video player in initState of header
// 3) Stack Positioning - Used Positioned to better style Stacks
// 4) Cubits to manage / save screen state
// 5) Nav Screen Keeps the same screen while changing page below.
// 6)

// You can make circles with Border.circular
//

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Netflix UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        backgroundColor: Colors.black,
        scaffoldBackgroundColor: Colors.black,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: NavScreen(),
    );
  }
}
