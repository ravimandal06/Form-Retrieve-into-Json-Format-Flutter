import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            SizedBox(
              height: 30.0,
            ),
            Text(
              "Flutter Form",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22.0),
            ),
            SizedBox(
              height: 30.0,
            ),
            Text(
              "Welcome",
              style: TextStyle(fontSize: 22.0),
            ),
            SizedBox(
              height: 40.0,
            ),
          ],
        ),
      ),
    ));
  }
}
