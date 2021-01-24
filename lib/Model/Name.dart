import 'package:sql_lite/Model/Model.dart';

class NameModel extends Model {
  static String table = 'names';
  int id;
  String name;
  String lastname;
  NameModel({this.id, this.name, this.lastname});

  static NameModel fromMap(Map<String, dynamic> map) {
    return NameModel(
      id: map["id"],
      name: map["name"].toString(),
      lastname: map["lastname"].toString(),
    );
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      "id": id,
      "name": name,
      "lastname": lastname,
    };

    if (id != null) {
      map["id"] = id;
    }
    return map;
  }
}
