import 'package:mysql1/mysql1.dart';
import 'package:crypt/crypt.dart';
import 'package:routier/API/config.dart';

class Query {
  static Future<List> select(String table,
      [List<String>? fields, String? condition]) async {
    var cnx = await MySqlConnection.connect(settings);
    String sql = "";
    if ((fields == null) && (condition == null)) {
      sql = "SELECT * FROM $table;";
    }
    if ((fields == null) && (condition != null)) {
      sql = "SELECT * FROM $table WHERE $condition;";
    }
    if ((fields != null) && (condition == null)) {
      String champs = '';
      for (var field in fields) {
        champs += (field + ",");
      }
      champs = champs.substring(0, champs.length - 1);
      sql = "SELECT $champs FROM $table;";
    }
    if ((fields != null) && (condition != null)) {
      String champs = '';
      for (var field in fields) {
        champs += (field + ",");
      }
      champs = champs.substring(0, champs.length - 1);
      sql = "SELECT $champs FROM $table WHERE $condition;";
    }
    print(sql);
    try {
      var result = await cnx.query(sql);
      await cnx.close();
      List data = [];
      for (var element in result) {
        data.add(element.fields.cast());
      }
      return data;
    } catch (e) {
      return [];
    }
  }

  static Future<List> custom(String sql) async {
    var cnx = await MySqlConnection.connect(settings);

    try {
      var result = await cnx.query(sql);
      await cnx.close();
      List<Map<String, dynamic>> data = [];
      for (var element in result) {
        // data.addAll(element.fields);
        data.add(element.fields);
      }
      print(data.length);
      return data;
    } catch (e) {
      return [];
    }
  }

  static Future<String> insert(String table, Map fields,
      [String? condition]) async {
    var cnx = await MySqlConnection.connect(settings);
    String sql = "";
    String pre = "";
    String data = "";
    fields.forEach((key, value) {
      if (key.toString() == "password") {
        pre += "`${key.toString()}`,";
        data += '"${Crypt.sha256(value.toString())}",';
      } else {
        pre += "`${key.toString()}`,";
        data += '"${value.toString()}",';
      }
    });
    pre = pre.substring(0, pre.length - 1);
    data = data.substring(0, data.length - 1);
    sql = "INSERT INTO $table($pre) VALUES($data)";

    if (condition != null) {
      sql = sql + " WHERE $condition;";
    } else {
      sql = sql + ";";
    }
    print(sql);
    try {
      await cnx.query(sql);
      return "success";
    } catch (e) {
      return e.toString();
    }
  }

  static Future<String> update(String table, Map fields, int id) async {
    var cnx = await MySqlConnection.connect(settings);
    String sql = "";
    String listening = "";
    fields.forEach((key, value) {
      listening += '`${key.toString()}`="${value.toString()}",';
    });
    listening = listening.substring(0, listening.length - 1);
    sql = 'UPDATE $table SET $listening WHERE  `id`=$id;';
    try {
      await cnx.query(sql);
      return "success";
    } catch (e) {
      return e.toString();
    }
  }

  static Future<String> delete(String table, int id) async {
    var cnx = await MySqlConnection.connect(settings);
    String sql = "DELETE FROM $table WHERE id = '$id';";
    try {
      await cnx.query(sql);
      return "success";
    } catch (e) {
      return e.toString();
    }
  }
}
