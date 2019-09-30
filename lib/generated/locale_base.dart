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

  LocaleboxInfo _boxInfo;
  LocaleboxInfo get boxInfo => _boxInfo;
  Localelogin _login;
  Localelogin get login => _login;
  LocalescreenName _screenName;
  LocalescreenName get screenName => _screenName;

  void initAll() {
    _boxInfo = LocaleboxInfo(Map<String, String>.from(_data['boxInfo']));
    _login = Localelogin(Map<String, String>.from(_data['login']));
    _screenName = LocalescreenName(Map<String, String>.from(_data['screenName']));
  }
}

class LocaleboxInfo {
  final Map<String, String> _data;
  LocaleboxInfo(this._data);

  String get boxNumber => _data["boxNumber"];
  String get date => _data["date"];
  String get boxCondition => _data["boxCondition"];
  String get boxNumberNew => _data["boxNumberNew"];
  String get cleaned => _data["cleaned"];
  String get occupied => _data["occupied"];
  String get eggCount => _data["eggCount"];
  String get chickCount => _data["chickCount"];
  String get chickAge => _data["chickAge"];
  String get specie => _data["specie"];
  String get ringed => _data["ringed"];
  String get comments => _data["comments"];
}
class Localelogin {
  final Map<String, String> _data;
  Localelogin(this._data);

  String get domain => _data["domain"];
  String get username => _data["username"];
  String get password => _data["password"];
  String get logInButton => _data["logInButton"];
}
class LocalescreenName {
  final Map<String, String> _data;
  LocalescreenName(this._data);

  String get map => _data["map"];
  String get nestingBox => _data["nestingBox"];
  String get boxInfo => _data["boxInfo"];
  String get inspectionInfo => _data["inspectionInfo"];
  String get inspectionNew => _data["inspectionNew"];
  String get boxNew => _data["boxNew"];
  String get load => _data["load"];
}
