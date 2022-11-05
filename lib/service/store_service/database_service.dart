import 'package:sqflite/sqflite.dart';
import 'package:x_music/service/store_service/constant/table_name.dart';

class DataBaseService {
  static final DataBaseService _singleton = DataBaseService._internal();
  factory DataBaseService() {
    return _singleton;
  }

  DataBaseService._internal();

  late Database _db;

  Future open(String path) async {
    _db = await openDatabase(path, version: 1, onCreate: (Database db, int version) async {
      await db.execute('''
create table ${TableName.downLoadMusicHistory} ( 
  id integer primary key autoincrement, 
  musicId text not null,
  musicName text not null,
  artistName text not null,
  filePath text not null,
  remoteUrl text not null,
  time integer not null)
''');
    });
  }

  Future<int> insert(String tableName, Map<String, dynamic> data) async {
    var id = await _db.insert(tableName, data);
    return id;
  }

  Future<Map?> query(String tableName, List<String> propertyName, {MapEntry<String, dynamic>? keyValue}) async {
    List<Map> maps = await _db.query(tableName, columns: propertyName, where: keyValue != null ? '${keyValue.key} = ?' : null, whereArgs: keyValue != null ? [keyValue.value] : null);
    if (maps.isNotEmpty) {
      return maps.first;
    }
    return null;
  }

  Future<List<Map>> queryAll(String tableName, List<String> propertyName, {MapEntry<String, dynamic>? keyValue}) async {
    List<Map> maps = await _db.query(tableName, columns: propertyName, where: keyValue != null ? '${keyValue.key} = ?' : null, whereArgs: keyValue != null ? [keyValue.value] : null);
    return maps;
  }

  Future<int> delete(String tableName, MapEntry<String, dynamic> keyValue) async {
    return await _db.delete(tableName, where: '${keyValue.key} = ?', whereArgs: [keyValue.value]);
  }
}
