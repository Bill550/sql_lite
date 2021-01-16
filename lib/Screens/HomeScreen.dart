import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController controllersstext = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 35.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                child: TextFormField(
                  controller: controllersstext,
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              child: RaisedButton(
                color: Colors.blueAccent,
                child: Text(
                  "Ok",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  
                },
              ),
            ),
            SizedBox(height: 30),
            Container(),
          ],
        ),
      ),
    );
  }
}