import 'package:sql_lite/Model/Model.dart';

class NameModel extends Model {
  static String table = 'Name';
  int id;
  String name;
  NameModel({
    this.id,
    this.name,
  });

  static NameModel fromMap(Map<String, dynamic> map) {
    return NameModel(
      id: map["id"],
      name: map["name"].toString(),
    );
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      "id": id,
      "name": name,
    };
    if (id != null) {
      map["id"] = id;
    }
    return map;
  }
}
