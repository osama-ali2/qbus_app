/// message : "success"
/// code : 1
/// data : {"additional":[{"id":5,"name":{"ur":"ice tea","ar":"شاي مثلج","en":"ice tea"},"icon":"hotel 2 star","created_at":"2022-06-07T08:22:19.000000Z","updated_at":"2022-06-07T08:22:19.000000Z","fees":"3"},{"id":6,"name":{"ur":"sandwich","ar":"ساندويتش","en":"sandwich"},"icon":"<i class=\"fas fa-hotel\"></i>","created_at":"2022-06-07T08:23:19.000000Z","updated_at":"2022-06-07T08:23:19.000000Z","fees":"10"}]}

class TripAdditionalsResponse {
  TripAdditionalsResponse({
    String? message,
    int? code,
    Data? data,
  }) {
    _message = message;
    _code = code;
    _data = data;
  }

  TripAdditionalsResponse.fromJson(dynamic json) {
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

/// additional : [{"id":5,"name":{"ur":"ice tea","ar":"شاي مثلج","en":"ice tea"},"icon":"hotel 2 star","created_at":"2022-06-07T08:22:19.000000Z","updated_at":"2022-06-07T08:22:19.000000Z","fees":"3"},{"id":6,"name":{"ur":"sandwich","ar":"ساندويتش","en":"sandwich"},"icon":"<i class=\"fas fa-hotel\"></i>","created_at":"2022-06-07T08:23:19.000000Z","updated_at":"2022-06-07T08:23:19.000000Z","fees":"10"}]

class Data {
  Data({
    List<Additional>? additional,
  }) {
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

/// id : 5
/// name : {"ur":"ice tea","ar":"شاي مثلج","en":"ice tea"}
/// icon : "hotel 2 star"
/// created_at : "2022-06-07T08:22:19.000000Z"
/// updated_at : "2022-06-07T08:22:19.000000Z"
/// fees : "3"

class Additional {
  Additional({
    int? id,
    Name? name,
    String? icon,
    String? createdAt,
    String? updatedAt,
    String? fees,
  }) {
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

/// ur : "ice tea"
/// ar : "شاي مثلج"
/// en : "ice tea"

class Name {
  Name({
    String? ur,
    String? ar,
    String? en,
  }) {
    _ur = ur;
    _ar = ar;
    _en = en;
  }

  Name.fromJson(dynamic json) {
    _ur = json['ur'];
    _ar = json['ar'];
    _en = json['en'];
  }

  String? _ur;
  String? _ar;
  String? _en;

  String? get ur => _ur;

  String? get ar => _ar;

  String? get en => _en;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['ur'] = _ur;
    map['ar'] = _ar;
    map['en'] = _en;
    return map;
  }
}
