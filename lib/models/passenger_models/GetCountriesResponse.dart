class GetCountriesResponse {
  GetCountriesResponse({
      int? code, 
      String? message, 
      Data? data,}){
    _code = code;
    _message = message;
    _data = data;
}

  GetCountriesResponse.fromJson(dynamic json) {
    _code = json['code'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  int? _code;
  String? _message;
  Data? _data;

  int? get code => _code;
  String? get message => _message;
  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = _code;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }

}

class Data {
  Data({
      List<Countries>? countries,}){
    _countries = countries;
}

  Data.fromJson(dynamic json) {
    if (json['countries'] != null) {
      _countries = [];
      json['countries'].forEach((v) {
        _countries?.add(Countries.fromJson(v));
      });
    }
  }
  List<Countries>? _countries;

  List<Countries>? get countries => _countries;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_countries != null) {
      map['countries'] = _countries?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Countries {
  Countries({
      String? id, 
      Name? name,}){
    _id = id;
    _name = name;
}

  Countries.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'] != null ? Name.fromJson(json['name']) : null;
  }
  String? _id;
  Name? _name;

  String? get id => _id;
  Name? get name => _name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    if (_name != null) {
      map['name'] = _name?.toJson();
    }
    return map;
  }

}

class Name {
  Name({
      String? ar, 
      String? en, 
      String? ur,}){
    _ar = ar;
    _en = en;
    _ur = ur;
}

  Name.fromJson(dynamic json) {
    _ar = json['ar'];
    _en = json['en'];
    _ur = json['ur'];
  }
  String? _ar;
  String? _en;
  String? _ur;

  String? get ar => _ar;
  String? get en => _en;
  String? get ur => _ur;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['ar'] = _ar;
    map['en'] = _en;
    map['ur'] = _ur;
    return map;
  }

}