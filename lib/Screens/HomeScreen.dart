import 'package:flutter/material.dart';
import 'package:sql_lite/Model/Name.dart';
// import 'package:sql_lite/Screens/DBData.dart';
import 'package:sql_lite/Services/Database.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  NameModel model;
  DBService dbService = DBService();

  final TextEditingController lastnameController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    dbService = DBService();
    model = NameModel();
    // if (widget) {

    // }
  }

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
                child: TextField(
                  decoration: InputDecoration(
                    labelText: "Enter Name",
                    fillColor: Colors.white,
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(15.0),
                      borderSide: new BorderSide(),
                    ),
                  ),
                  controller: nameController,
                ),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: Container(
                child: TextField(
                  decoration: InputDecoration(
                    labelText: "Enter Last Name",
                    fillColor: Colors.white,
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(15.0),
                      borderSide: new BorderSide(),
                    ),
                  ),
                  controller: lastnameController,
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              child: MaterialButton(
                color: Colors.blueAccent,
                child: Text(
                  "Ok",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  setState(() {
                    model.name = nameController.text;
                    model.lastname = lastnameController.text;
                    print(model.name);
                    print(model.lastname);
                  });
                  dbService.addName(model);
                },
              ),
            ),
            SizedBox(height: 30),
            Container(
              child: MaterialButton(
                child: Text(
                  'DB-DATA',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/dbdata');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
