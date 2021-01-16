import 'package:sql_lite/Model/Name.dart';
import 'package:sql_lite/Services/DBHelper.dart';

class DBService {
  Future<bool> addName(NameModel model) async {
    await DB.init();
    bool isSaved = false;
    if (model != null) {
      int inserted = await DB.insert(NameModel.table, model);
      isSaved = inserted == 1 ? true : false;
    }
    return isSaved;
  }

  Future<bool> updateName(NameModel model) async {
    await DB.init();
    bool isSaved = false;
    if (model != null) {
      int inserted = await DB.update(NameModel.table, model);
      isSaved = inserted == 1 ? true : false;
    }
    return isSaved;
  }

  Future<List<NameModel>> getName() async {
    await DB.init();
    List<Map<String, dynamic>> names = await DB.query(NameModel.table);
    return names.map((e) => NameModel.fromMap(e)).toList();
  }

  Future<bool> deleteVideo(NameModel model) async {
    await DB.init();
    bool isSaved = false;
    if (model != null) {
      int inserted = await DB.delete(NameModel.table, model);
      isSaved = inserted == 1 ? true : false;
    }
    return isSaved;
  }
}
