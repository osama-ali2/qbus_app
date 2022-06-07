/// message : "success"
/// code : 1
/// data : {"cites":[{"id":2,"name":{"ar":"دبي","en":"Dubai","ur":"Dubai"},"created_at":"2022-03-27T18:36:06.000000Z","updated_at":"2022-05-28T05:21:00.000000Z"},{"id":3,"name":{"ar":"الشارقة","en":"Sharjah","ur":"Sharjah"},"created_at":"2022-03-29T04:11:34.000000Z","updated_at":"2022-05-28T05:21:19.000000Z"},{"id":4,"name":{"ar":"عجمان","en":"Ajman","ur":"Ajman"},"created_at":"2022-03-29T04:11:55.000000Z","updated_at":"2022-05-28T05:21:25.000000Z"},{"id":5,"name":{"ar":"العين","en":"Al Ain","ur":"Al Ain"},"created_at":"2022-03-29T04:11:55.000000Z","updated_at":"2022-05-28T05:21:30.000000Z"}]}

class GetCitiesResponse {
  GetCitiesResponse({
    String? message,
    int? code,
    Data? data,
  }) {
    _message = message;
    _code = code;
    _data = data;
  }

  GetCitiesResponse.fromJson(dynamic json) {
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

/// cites : [{"id":2,"name":{"ar":"دبي","en":"Dubai","ur":"Dubai"},"created_at":"2022-03-27T18:36:06.000000Z","updated_at":"2022-05-28T05:21:00.000000Z"},{"id":3,"name":{"ar":"الشارقة","en":"Sharjah","ur":"Sharjah"},"created_at":"2022-03-29T04:11:34.000000Z","updated_at":"2022-05-28T05:21:19.000000Z"},{"id":4,"name":{"ar":"عجمان","en":"Ajman","ur":"Ajman"},"created_at":"2022-03-29T04:11:55.000000Z","updated_at":"2022-05-28T05:21:25.000000Z"},{"id":5,"name":{"ar":"العين","en":"Al Ain","ur":"Al Ain"},"created_at":"2022-03-29T04:11:55.000000Z","updated_at":"2022-05-28T05:21:30.000000Z"}]

class Data {
  Data({
    List<Cites>? cites,
  }) {
    _cites = cites;
  }

  Data.fromJson(dynamic json) {
    if (json['cites'] != null) {
      _cites = [];
      json['cites'].forEach((v) {
        _cites?.add(Cites.fromJson(v));
      });
    }
  }

  List<Cites>? _cites;

  List<Cites>? get cites => _cites;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_cites != null) {
      map['cites'] = _cites?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// id : 2
/// name : {"ar":"دبي","en":"Dubai","ur":"Dubai"}
/// created_at : "2022-03-27T18:36:06.000000Z"
/// updated_at : "2022-05-28T05:21:00.000000Z"

class Cites {
  Cites({
    int? id,
    Name? name,
    String? createdAt,
    String? updatedAt,
  }) {
    _id = id;
    _name = name;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  Cites.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'] != null ? Name.fromJson(json['name']) : null;
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }

  int? _id;
  Name? _name;
  String? _createdAt;
  String? _updatedAt;

  int? get id => _id;

  Name? get name => _name;

  String? get createdAt => _createdAt;

  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    if (_name != null) {
      map['name'] = _name?.toJson();
    }
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }
}

/// ar : "دبي"
/// en : "Dubai"
/// ur : "Dubai"

class Name {
  Name({
    String? ar,
    String? en,
    String? ur,
  }) {
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
