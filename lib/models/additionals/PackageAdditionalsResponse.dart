/// message : "success"
/// code : 1
/// data : {"additional":[{"id":1,"name":{"ar":"فندق","en":"Hotel"},"icon":"<i class=\"fas fa-hotel\"></i>","created_at":"2022-04-25T13:40:42.000000Z","updated_at":"2022-04-25T13:41:09.000000Z","fees":"0"},{"id":3,"name":{"ar":"انترنت","en":"Internet"},"icon":"<i class=\"fas fa-wifi\"></i>","created_at":"2022-04-25T13:47:28.000000Z","updated_at":"2022-04-25T13:47:28.000000Z","fees":"0"}]}

class PackageAdditionalsResponse {
  PackageAdditionalsResponse({
      String? message, 
      int? code, 
      Data? data,}){
    _message = message;
    _code = code;
    _data = data;
}

  PackageAdditionalsResponse.fromJson(dynamic json) {
    _message = json['message'];
    _code = json['code'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  String? _message;
  int? _code;
  Data? _data;

  String? get message => _message;
  int? get code => _code;
  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    map['code'] = _code;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }

}

/// additional : [{"id":1,"name":{"ar":"فندق","en":"Hotel"},"icon":"<i class=\"fas fa-hotel\"></i>","created_at":"2022-04-25T13:40:42.000000Z","updated_at":"2022-04-25T13:41:09.000000Z","fees":"0"},{"id":3,"name":{"ar":"انترنت","en":"Internet"},"icon":"<i class=\"fas fa-wifi\"></i>","created_at":"2022-04-25T13:47:28.000000Z","updated_at":"2022-04-25T13:47:28.000000Z","fees":"0"}]

class Data {
  Data({
      List<Additional>? additional,}){
    _additional = additional;
}

  Data.fromJson(dynamic json) {
    if (json['additional'] != null) {
      _additional = [];
      json['additional'].forEach((v) {
        _additional?.add(Additional.fromJson(v));
      });
    }
  }
  List<Additional>? _additional;

  List<Additional>? get additional => _additional;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_additional != null) {
      map['additional'] = _additional?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 1
/// name : {"ar":"فندق","en":"Hotel"}
/// icon : "<i class=\"fas fa-hotel\"></i>"
/// created_at : "2022-04-25T13:40:42.000000Z"
/// updated_at : "2022-04-25T13:41:09.000000Z"
/// fees : "0"

class Additional {
  Additional({
      int? id, 
      Name? name, 
      String? icon, 
      String? createdAt, 
      String? updatedAt, 
      String? fees,}){
    _id = id;
    _name = name;
    _icon = icon;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _fees = fees;
}

  Additional.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'] != null ? Name.fromJson(json['name']) : null;
    _icon = json['icon'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _fees = json['fees'];
  }
  int? _id;
  Name? _name;
  String? _icon;
  String? _createdAt;
  String? _updatedAt;
  String? _fees;

  int? get id => _id;
  Name? get name => _name;
  String? get icon => _icon;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  String? get fees => _fees;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    if (_name != null) {
      map['name'] = _name?.toJson();
    }
    map['icon'] = _icon;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['fees'] = _fees;
    return map;
  }

}

/// ar : "فندق"
/// en : "Hotel"

class Name {
  Name({
      String? ar, 
      String? en,}){
    _ar = ar;
    _en = en;
}

  Name.fromJson(dynamic json) {
    _ar = json['ar'];
    _en = json['en'];
  }
  String? _ar;
  String? _en;

  String? get ar => _ar;
  String? get en => _en;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['ar'] = _ar;
    map['en'] = _en;
    return map;
  }

}