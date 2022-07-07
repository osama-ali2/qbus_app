/// message : "success"
/// code : 1
/// data : {"additional":[{"id":1,"name":{"ar":"فندق","en":"Hotel"},"icon":"no-image.png","created_at":"2022-04-25T13:40:42.000000Z","updated_at":"2022-04-25T13:41:09.000000Z"},{"id":2,"name":{"ar":"وجبة","en":"Meal"},"icon":"no-image.png","created_at":"2022-04-25T13:42:06.000000Z","updated_at":"2022-04-25T13:46:58.000000Z"},{"id":3,"name":{"ar":"انترنت","en":"Internet"},"icon":"no-image.png","created_at":"2022-04-25T13:47:28.000000Z","updated_at":"2022-04-25T13:47:28.000000Z"},{"id":4,"name":{"ur":"hotel 2 star","ar":"فندق نجمتين","en":"hotel 2 star"},"icon":"no-image.png","created_at":"2022-06-07T08:21:44.000000Z","updated_at":"2022-06-07T08:21:44.000000Z"},{"id":5,"name":{"ur":"ice tea","ar":"شاي مثلج","en":"ice tea"},"icon":"no-image.png","created_at":"2022-06-07T08:22:19.000000Z","updated_at":"2022-06-07T08:22:19.000000Z"},{"id":6,"name":{"ur":"sandwich","ar":"ساندويتش","en":"sandwich"},"icon":"no-image.png","created_at":"2022-06-07T08:23:19.000000Z","updated_at":"2022-06-07T08:23:19.000000Z"}],"image_base":"https://qbus.rabaaladawia.com/public/images/additional"}

class GetAdditionalResponse {
  GetAdditionalResponse({
      String? message, 
      int? code, 
      Data? data,}){
    _message = message;
    _code = code;
    _data = data;
}

  GetAdditionalResponse.fromJson(dynamic json) {
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

/// additional : [{"id":1,"name":{"ar":"فندق","en":"Hotel"},"icon":"no-image.png","created_at":"2022-04-25T13:40:42.000000Z","updated_at":"2022-04-25T13:41:09.000000Z"},{"id":2,"name":{"ar":"وجبة","en":"Meal"},"icon":"no-image.png","created_at":"2022-04-25T13:42:06.000000Z","updated_at":"2022-04-25T13:46:58.000000Z"},{"id":3,"name":{"ar":"انترنت","en":"Internet"},"icon":"no-image.png","created_at":"2022-04-25T13:47:28.000000Z","updated_at":"2022-04-25T13:47:28.000000Z"},{"id":4,"name":{"ur":"hotel 2 star","ar":"فندق نجمتين","en":"hotel 2 star"},"icon":"no-image.png","created_at":"2022-06-07T08:21:44.000000Z","updated_at":"2022-06-07T08:21:44.000000Z"},{"id":5,"name":{"ur":"ice tea","ar":"شاي مثلج","en":"ice tea"},"icon":"no-image.png","created_at":"2022-06-07T08:22:19.000000Z","updated_at":"2022-06-07T08:22:19.000000Z"},{"id":6,"name":{"ur":"sandwich","ar":"ساندويتش","en":"sandwich"},"icon":"no-image.png","created_at":"2022-06-07T08:23:19.000000Z","updated_at":"2022-06-07T08:23:19.000000Z"}]
/// image_base : "https://qbus.rabaaladawia.com/public/images/additional"

class Data {
  Data({
      List<Additional>? additional, 
      String? imageBase,}){
    _additional = additional;
    _imageBase = imageBase;
}

  Data.fromJson(dynamic json) {
    if (json['additional'] != null) {
      _additional = [];
      json['additional'].forEach((v) {
        _additional?.add(Additional.fromJson(v));
      });
    }
    _imageBase = json['image_base'];
  }
  List<Additional>? _additional;
  String? _imageBase;

  List<Additional>? get additional => _additional;
  String? get imageBase => _imageBase;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_additional != null) {
      map['additional'] = _additional?.map((v) => v.toJson()).toList();
    }
    map['image_base'] = _imageBase;
    return map;
  }

}

/// id : 1
/// name : {"ar":"فندق","en":"Hotel"}
/// icon : "no-image.png"
/// created_at : "2022-04-25T13:40:42.000000Z"
/// updated_at : "2022-04-25T13:41:09.000000Z"

class Additional {
  Additional({
      int? id, 
      Name? name, 
      String? icon, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _name = name;
    _icon = icon;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Additional.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'] != null ? Name.fromJson(json['name']) : null;
    _icon = json['icon'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  int? _id;
  Name? _name;
  String? _icon;
  String? _createdAt;
  String? _updatedAt;

  int? get id => _id;
  Name? get name => _name;
  String? get icon => _icon;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    if (_name != null) {
      map['name'] = _name?.toJson();
    }
    map['icon'] = _icon;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
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