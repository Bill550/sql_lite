import 'package:flutter/material.dart';
import 'package:sql_lite/Model/Name.dart';
import 'package:sql_lite/Services/Database.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  NameModel nameModel;
  DBService dbService;

  final TextEditingController lastnameController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    dbService = DBService();
    nameModel = NameModel();
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
                    nameModel.name = nameController.text;
                    nameModel.lastname = lastnameController.text;
                    print(nameModel.name);
                    print(nameModel.lastname);
                  });
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
