import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

class ApiMIX {
  static Future get(uri, path, [Map? params, String? _token]) async {
    var q = "";
    var link = "";
    if (params != null) {
      q = "?";

      params.forEach((key, value) {
        q += key.toString() + "=" + value.toString() + "&";
      });
      _token != null ? q += "_token=$_token" : q = q.substring(0, q.length - 1);
      link = uri + path + q;
    } else {
      link = uri + path;
    }
    print(link);

    try {
      var response = await http.get(Uri.parse(link), headers: _setHeaders());
      print(response.body);

      if (response.statusCode == 200) {
        print(response.statusCode);
        return response.body;
      } else {
        return "Impossible de se connecter au serveur";
      }
    } catch (e) {
      return "Impossible de se connecter au serveur";
    }
  }

  static _setHeaders() => {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      };

  static Future<String> uploadFile(String fileName, base64Image, File realImage,
      String link, String table) async {
    base64Image = base64Encode(realImage.readAsBytesSync());
    try {
      var response = await http.post(Uri.parse(link),
          body: {'image': base64Image, 'name': fileName, 'table': table});
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return "error";
      }
    } catch (e) {
      return "error";
    }
  }

  static Future<Map> rmFiles(String uri, List<String> files, path) async {
    String q = "?";
    for (var i = 0; i < files.length; i++) {
      q += "image" + i.toString() + "=" + files[i] + "&";
    }
    q += "path=" + path;

    var link = uri + "file/destroy" + q;
    print(link);
    try {
      var response = await http.get(Uri.parse(link), headers: _setHeaders());

      if (response.statusCode == 200) {
        return {
          'status': 1,
          'data': jsonDecode(response.body),
        };
      }
    } catch (e) {
      return {
        'status': -1,
        'data': e,
      };
    }
    return {};
  }
}
