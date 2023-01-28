/// code : 1
/// message : "success"
/// data : {"rooms":[{"id":"1","name":{"en":"Mina Concorde","ar":"منى كونكورد","ur":"Mina Concorde"},"city":"Makka","fees":"100","rate":"4","type":{"ar":"مزدوج","en":"Double","ur":"Double"},"room_quantity":"1","bed_quantity":"1","max_adult":"2","image":"default.png"},{"id":"2","name":{"en":"Mina Concorde","ar":"منى كونكورد","ur":"Mina Concorde"},"city":"Makka","fees":"100","rate":"4","type":{"ar":"ثنائي","en":"Twin","ur":"Twin"},"room_quantity":"1","bed_quantity":"2","max_adult":"2","image":"default.png"},{"id":"3","name":{"en":"Mina Concorde","ar":"منى كونكورد","ur":"Mina Concorde"},"city":"Makka","fees":"100","rate":"4","type":{"ar":"ثلاثي","en":"Triple","ur":"Triple"},"room_quantity":"1","bed_quantity":"3","max_adult":"3","image":"default.png"},{"id":"4","name":{"en":"Mina Concorde","ar":"منى كونكورد","ur":"Mina Concorde"},"city":"Makka","fees":"100","rate":"4","type":{"ar":"رباعي","en":"Quad","ur":"Quad"},"room_quantity":"1","bed_quantity":"4","max_adult":"4","image":"default.png"},{"id":"5","name":{"en":"Mina Concorde","ar":"منى كونكورد","ur":"Mina Concorde"},"city":"Makka","fees":"100","rate":"4","type":{"ar":"خماسي","en":"Quintuple","ur":"Quintuple"},"room_quantity":"1","bed_quantity":"5","max_adult":"5","image":"default.png"},{"id":"6","name":{"en":"Mina Concorde","ar":"منى كونكورد","ur":"Mina Concorde"},"city":"Makka","fees":"30","rate":"4","type":{"ar":"مشترك","en":"Share","ur":"Share"},"room_quantity":"1","bed_quantity":"1","max_adult":"1","image":"default.png"}],"image_base":"https://qbus-sa.com/public/images/hotels"}

class HotelRoomResponse {
  HotelRoomResponse({
    num? code,
    String? message,
    Data? data,
  }) {
    _code = code;
    _message = message;
    _data = data;
  }

  HotelRoomResponse.fromJson(dynamic json) {
    _code = json['code'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  num? _code;
  String? _message;
  Data? _data;

  num? get code => _code;

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

/// rooms : [{"id":"1","name":{"en":"Mina Concorde","ar":"منى كونكورد","ur":"Mina Concorde"},"city":"Makka","fees":"100","rate":"4","type":{"ar":"مزدوج","en":"Double","ur":"Double"},"room_quantity":"1","bed_quantity":"1","max_adult":"2","image":"default.png"},{"id":"2","name":{"en":"Mina Concorde","ar":"منى كونكورد","ur":"Mina Concorde"},"city":"Makka","fees":"100","rate":"4","type":{"ar":"ثنائي","en":"Twin","ur":"Twin"},"room_quantity":"1","bed_quantity":"2","max_adult":"2","image":"default.png"},{"id":"3","name":{"en":"Mina Concorde","ar":"منى كونكورد","ur":"Mina Concorde"},"city":"Makka","fees":"100","rate":"4","type":{"ar":"ثلاثي","en":"Triple","ur":"Triple"},"room_quantity":"1","bed_quantity":"3","max_adult":"3","image":"default.png"},{"id":"4","name":{"en":"Mina Concorde","ar":"منى كونكورد","ur":"Mina Concorde"},"city":"Makka","fees":"100","rate":"4","type":{"ar":"رباعي","en":"Quad","ur":"Quad"},"room_quantity":"1","bed_quantity":"4","max_adult":"4","image":"default.png"},{"id":"5","name":{"en":"Mina Concorde","ar":"منى كونكورد","ur":"Mina Concorde"},"city":"Makka","fees":"100","rate":"4","type":{"ar":"خماسي","en":"Quintuple","ur":"Quintuple"},"room_quantity":"1","bed_quantity":"5","max_adult":"5","image":"default.png"},{"id":"6","name":{"en":"Mina Concorde","ar":"منى كونكورد","ur":"Mina Concorde"},"city":"Makka","fees":"30","rate":"4","type":{"ar":"مشترك","en":"Share","ur":"Share"},"room_quantity":"1","bed_quantity":"1","max_adult":"1","image":"default.png"}]
/// image_base : "https://qbus-sa.com/public/images/hotels"

class Data {
  Data({
    List<Rooms>? rooms,
    String? imageBase,
  }) {
    _rooms = rooms;
    _imageBase = imageBase;
  }

  Data.fromJson(dynamic json) {
    if (json['rooms'] != null) {
      _rooms = [];
      json['rooms'].forEach((v) {
        _rooms?.add(Rooms.fromJson(v));
      });
    }
    _imageBase = json['image_base'];
  }

  List<Rooms>? _rooms;
  String? _imageBase;

  List<Rooms>? get rooms => _rooms;

  String? get imageBase => _imageBase;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_rooms != null) {
      map['rooms'] = _rooms?.map((v) => v.toJson()).toList();
    }
    map['image_base'] = _imageBase;
    return map;
  }
}

/// id : "1"
/// name : {"en":"Mina Concorde","ar":"منى كونكورد","ur":"Mina Concorde"}
/// city : "Makka"
/// fees : "100"
/// rate : "4"
/// type : {"ar":"مزدوج","en":"Double","ur":"Double"}
/// room_quantity : "1"
/// bed_quantity : "1"
/// max_adult : "2"
/// image : "default.png"

class Rooms {
  Rooms({
    String? id,
    Name? name,
    String? city,
    String? fees,
    String? rate,
    Type? type,
    String? roomQuantity,
    String? bedQuantity,
    String? maxAdult,
    String? image,
  }) {
    _id = id;
    _name = name;
    _city = city;
    _fees = fees;
    _rate = rate;
    _type = type;
    _roomQuantity = roomQuantity;
    _bedQuantity = bedQuantity;
    _maxAdult = maxAdult;
    _image = image;
  }

  Rooms.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'] != null ? Name.fromJson(json['name']) : null;
    _city = json['city'];
    _fees = json['fees'];
    _rate = json['rate'];
    _type = json['type'] != null ? Type.fromJson(json['type']) : null;
    _roomQuantity = json['room_quantity'];
    _bedQuantity = json['bed_quantity'];
    _maxAdult = json['max_adult'];
    _image = json['image'];
  }

  String? _id;
  Name? _name;
  String? _city;
  String? _fees;
  String? _rate;
  Type? _type;
  String? _roomQuantity;
  String? _bedQuantity;
  String? _maxAdult;
  String? _image;

  String? get id => _id;

  Name? get name => _name;

  String? get city => _city;

  String? get fees => _fees;

  String? get rate => _rate;

  Type? get type => _type;

  String? get roomQuantity => _roomQuantity;

  String? get bedQuantity => _bedQuantity;

  String? get maxAdult => _maxAdult;

  String? get image => _image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    if (_name != null) {
      map['name'] = _name?.toJson();
    }
    map['city'] = _city;
    map['fees'] = _fees;
    map['rate'] = _rate;
    if (_type != null) {
      map['type'] = _type?.toJson();
    }
    map['room_quantity'] = _roomQuantity;
    map['bed_quantity'] = _bedQuantity;
    map['max_adult'] = _maxAdult;
    map['image'] = _image;
    return map;
  }
}

/// ar : "مزدوج"
/// en : "Double"
/// ur : "Double"

class Type {
  Type({
    String? ar,
    String? en,
    String? ur,
  }) {
    _ar = ar;
    _en = en;
    _ur = ur;
  }

  Type.fromJson(dynamic json) {
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

/// en : "Mina Concorde"
/// ar : "منى كونكورد"
/// ur : "Mina Concorde"

class Name {
  Name({
    String? en,
    String? ar,
    String? ur,
  }) {
    _en = en;
    _ar = ar;
    _ur = ur;
  }

  Name.fromJson(dynamic json) {
    _en = json['en'];
    _ar = json['ar'];
    _ur = json['ur'];
  }

  String? _en;
  String? _ar;
  String? _ur;

  String? get en => _en;

  String? get ar => _ar;

  String? get ur => _ur;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['en'] = _en;
    map['ar'] = _ar;
    map['ur'] = _ur;
    return map;
  }
}
