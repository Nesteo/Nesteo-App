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
  LocaleboxList _boxList;
  LocaleboxList get boxList => _boxList;
  LocaleboxNew _boxNew;
  LocaleboxNew get boxNew => _boxNew;
  Localelogin _login;
  Localelogin get login => _login;
  LocalescreenName _screenName;
  LocalescreenName get screenName => _screenName;

  void initAll() {
    _boxInfo = LocaleboxInfo(Map<String, String>.from(_data['boxInfo']));
    _boxList = LocaleboxList(Map<String, String>.from(_data['boxList']));
    _boxNew = LocaleboxNew(Map<String, String>.from(_data['boxNew']));
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
  String get boxNumNew => _data["boxNumNew"];
  String get cleaned => _data["cleaned"];
  String get occupied => _data["occupied"];
  String get eggCount => _data["eggCount"];
  String get chickCount => _data["chickCount"];
  String get chickAge => _data["chickAge"];
  String get specie => _data["specie"];
  String get ringed => _data["ringed"];
  String get comment => _data["comment"];
  String get user => _data["user"];
  String get repair => _data["repair"];
  String get containsEggs => _data["containsEggs"];
  String get femaleInBox => _data["femaleInBox"];
  String get maleInBox => _data["maleInBox"];
  String get addPhoto => _data["addPhoto"];
  String get boxConditionReplace => _data["boxConditionReplace"];
  String get boxConditionRepair => _data["boxConditionRepair"];
  String get boxConditionFixed => _data["boxConditionFixed"];
}
class LocaleboxList {
  final Map<String, String> _data;
  LocaleboxList(this._data);

  String get sortByID => _data["sortByID"];
  String get sortByLastInspection => _data["sortByLastInspection"];
}
class LocaleboxNew {
  final Map<String, String> _data;
  LocaleboxNew(this._data);

  String get id => _data["id"];
  String get oldid => _data["oldid"];
  String get addBox => _data["addBox"];
  String get hangDate => _data["hangDate"];
  String get untreatedWood => _data["untreatedWood"];
  String get material => _data["material"];
  String get treatedWood => _data["treatedWood"];
  String get holeSize => _data["holeSize"];
  String get big => _data["big"];
  String get medium => _data["medium"];
  String get small => _data["small"];
  String get concrete => _data["concrete"];
  String get addImage => _data["addImage"];
  String get getPosition => _data["getPosition"];
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
  String get list => _data["list"];
}
