import 'package:flutter/material.dart';
import 'MainScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: MainScreen(),
        title: 'DSC TASK-8',
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          primaryColor: Color(0xff171A20),
          scaffoldBackgroundColor: Color(0xff242A33),
        ));
  }
}
