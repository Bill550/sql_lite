import 'package:flutter/material.dart';
import 'package:sql_lite/Model/Name.dart';
import 'package:sql_lite/Services/Database.dart';

class DBData extends StatefulWidget {
  @override
  _DBDataState createState() => _DBDataState();
}

class _DBDataState extends State<DBData> {
  DBService dbService = DBService();
  @override
  void initState() {
    super.initState();
    dbService = DBService();
  }

  Future<List<NameModel>> fetchFromDataBase() async {
    Future<List<NameModel>> images = dbService.getName();
    return images;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
        child: Center(
          child: Container(
            child: FutureBuilder<List<NameModel>>(
              future: dbService.getName(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, int index) {
                      NameModel model = snapshot.data[index];
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            model.name,
                            style: TextStyle(color: Colors.black, fontSize: 15),
                          ),
                          Text(
                            model.lastname,
                            style: TextStyle(color: Colors.black, fontSize: 15),
                          ),
                          // SizedBox(),

                          MaterialButton(
                            onPressed: () {
                              setState(() {
                                dbService.deleteName(model);
                              });
                            },
                            color: Colors.white,
                            child: Text('Delete'),
                          )
                        ],
                      );
                    },
                  );
                } else {
                  return Card();
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
