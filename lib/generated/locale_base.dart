import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class LocaleBase {
  Map<String, dynamic> _data;
  String _path;
  Future<void> load(String path) async {
    _path = path;
    final strJson = await rootBundle.loadString(path);
    _data = jsonDecode(strJson);
    initAll();
  }
  
  Map<String, String> getData(String group) {
    return Map<String, String>.from(_data[group]);
  }

  String getPath() => _path;

  Localelogin _login;
  Localelogin get login => _login;
  Localemain _main;
  Localemain get main => _main;

  void initAll() {
    _login = Localelogin(Map<String, String>.from(_data['login']));
    _main = Localemain(Map<String, String>.from(_data['main']));
  }
}

class Localelogin {
  final Map<String, String> _data;
  Localelogin(this._data);

  String get domain => _data["domain"];
  String get username => _data["username"];
  String get password => _data["password"];
  String get logInButton => _data["logInButton"];
}
class Localemain {
  final Map<String, String> _data;
  Localemain(this._data);

  String get sample => _data["sample"];
  String get save => _data["save"];
}
