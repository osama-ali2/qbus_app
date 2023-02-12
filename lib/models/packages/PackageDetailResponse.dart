/// message : "messages.success"
/// code : 1
/// data : {"packages":{"id":7,"provider_id":1,"name":{"en":"Makkah","ar":"مكة","ur":"مکہ"},"date_from":"2022-12-29","time_from":"14:00","description":null,"image":"1671978797_278-الكعبة.jpg","fees":150,"start_station_name":"{\"en\":\"Alahsa\",\"ar\":\"'ا''ل'ا''ح'س'ا'ء'\",\"ur\":\"alahsa\"}","rate":0,"additionals":[{"id":1,"fees":2,"name":{"en":"شاي","ar":"شاي","ur":"tea"}}],"destinations":[{"id":1,"provider_id":1,"from_city_id":4,"to_city_id":2,"starting_terminal_id":1,"arrival_terminal_id":2,"stops":null,"created_at":"2022-12-18T13:33:00.000000Z","updated_at":"2022-12-18T13:33:00.000000Z","name":"Alahsa - Makka","from_city":{"id":4,"name":{"en":"Alahsa","ar":"الاحساء","ur":"alahsa"},"created_at":"2022-11-13T12:04:05.000000Z","updated_at":"2022-11-13T12:04:35.000000Z"},"to_city":{"id":2,"name":{"en":"Makka","ar":"مكة المكرمة","ur":"Makka"},"created_at":"2022-11-13T11:44:12.000000Z","updated_at":"2022-11-13T11:44:12.000000Z"}},{"id":2,"provider_id":1,"from_city_id":2,"to_city_id":4,"starting_terminal_id":1,"arrival_terminal_id":2,"stops":null,"created_at":"2022-12-18T13:33:24.000000Z","updated_at":"2022-12-18T13:33:24.000000Z","name":"Makka - Alahsa","from_city":{"id":2,"name":{"en":"Makka","ar":"مكة المكرمة","ur":"Makka"},"created_at":"2022-11-13T11:44:12.000000Z","updated_at":"2022-11-13T11:44:12.000000Z"},"to_city":{"id":4,"name":{"en":"Alahsa","ar":"الاحساء","ur":"alahsa"},"created_at":"2022-11-13T12:04:05.000000Z","updated_at":"2022-11-13T12:04:35.000000Z"}}]},"image_base":"https://qbus-sa.com/public/images/packages"}

class PackageDetailResponse {
  PackageDetailResponse({
    String? message,
    num? code,
    Data? data,
  }) {
    _message = message;
    _code = code;
    _data = data;
  }

  PackageDetailResponse.fromJson(dynamic json) {
    _message = json['message'];
    _code = json['code'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  String? _message;
  num? _code;
  Data? _data;

  String? get message => _message;

  num? get code => _code;

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

/// packages : {"id":7,"provider_id":1,"name":{"en":"Makkah","ar":"مكة","ur":"مکہ"},"date_from":"2022-12-29","time_from":"14:00","description":null,"image":"1671978797_278-الكعبة.jpg","fees":150,"start_station_name":"{\"en\":\"Alahsa\",\"ar\":\"'ا''ل'ا''ح'س'ا'ء'\",\"ur\":\"alahsa\"}","rate":0,"additionals":[{"id":1,"fees":2,"name":{"en":"شاي","ar":"شاي","ur":"tea"}}],"destinations":[{"id":1,"provider_id":1,"from_city_id":4,"to_city_id":2,"starting_terminal_id":1,"arrival_terminal_id":2,"stops":null,"created_at":"2022-12-18T13:33:00.000000Z","updated_at":"2022-12-18T13:33:00.000000Z","name":"Alahsa - Makka","from_city":{"id":4,"name":{"en":"Alahsa","ar":"الاحساء","ur":"alahsa"},"created_at":"2022-11-13T12:04:05.000000Z","updated_at":"2022-11-13T12:04:35.000000Z"},"to_city":{"id":2,"name":{"en":"Makka","ar":"مكة المكرمة","ur":"Makka"},"created_at":"2022-11-13T11:44:12.000000Z","updated_at":"2022-11-13T11:44:12.000000Z"}},{"id":2,"provider_id":1,"from_city_id":2,"to_city_id":4,"starting_terminal_id":1,"arrival_terminal_id":2,"stops":null,"created_at":"2022-12-18T13:33:24.000000Z","updated_at":"2022-12-18T13:33:24.000000Z","name":"Makka - Alahsa","from_city":{"id":2,"name":{"en":"Makka","ar":"مكة المكرمة","ur":"Makka"},"created_at":"2022-11-13T11:44:12.000000Z","updated_at":"2022-11-13T11:44:12.000000Z"},"to_city":{"id":4,"name":{"en":"Alahsa","ar":"الاحساء","ur":"alahsa"},"created_at":"2022-11-13T12:04:05.000000Z","updated_at":"2022-11-13T12:04:35.000000Z"}}]}
/// image_base : "https://qbus-sa.com/public/images/packages"

class Data {
  Data({
    Packages? packages,
    String? imageBase,
  }) {
    _packages = packages;
    _imageBase = imageBase;
  }

  Data.fromJson(dynamic json) {
    _packages =
        json['packages'] != null ? Packages.fromJson(json['packages']) : null;
    _imageBase = json['image_base'];
  }

  Packages? _packages;
  String? _imageBase;

  Packages? get packages => _packages;

  String? get imageBase => _imageBase;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_packages != null) {
      map['packages'] = _packages?.toJson();
    }
    map['image_base'] = _imageBase;
    return map;
  }
}

/// id : 7
/// provider_id : 1
/// name : {"en":"Makkah","ar":"مكة","ur":"مکہ"}
/// date_from : "2022-12-29"
/// time_from : "14:00"
/// description : null
/// image : "1671978797_278-الكعبة.jpg"
/// fees : 150
/// start_station_name : "{\"en\":\"Alahsa\",\"ar\":\"'ا''ل'ا''ح'س'ا'ء'\",\"ur\":\"alahsa\"}"
/// rate : 0
/// additionals : [{"id":1,"fees":2,"name":{"en":"شاي","ar":"شاي","ur":"tea"}}]
/// destinations : [{"id":1,"provider_id":1,"from_city_id":4,"to_city_id":2,"starting_terminal_id":1,"arrival_terminal_id":2,"stops":null,"created_at":"2022-12-18T13:33:00.000000Z","updated_at":"2022-12-18T13:33:00.000000Z","name":"Alahsa - Makka","from_city":{"id":4,"name":{"en":"Alahsa","ar":"الاحساء","ur":"alahsa"},"created_at":"2022-11-13T12:04:05.000000Z","updated_at":"2022-11-13T12:04:35.000000Z"},"to_city":{"id":2,"name":{"en":"Makka","ar":"مكة المكرمة","ur":"Makka"},"created_at":"2022-11-13T11:44:12.000000Z","updated_at":"2022-11-13T11:44:12.000000Z"}},{"id":2,"provider_id":1,"from_city_id":2,"to_city_id":4,"starting_terminal_id":1,"arrival_terminal_id":2,"stops":null,"created_at":"2022-12-18T13:33:24.000000Z","updated_at":"2022-12-18T13:33:24.000000Z","name":"Makka - Alahsa","from_city":{"id":2,"name":{"en":"Makka","ar":"مكة المكرمة","ur":"Makka"},"created_at":"2022-11-13T11:44:12.000000Z","updated_at":"2022-11-13T11:44:12.000000Z"},"to_city":{"id":4,"name":{"en":"Alahsa","ar":"الاحساء","ur":"alahsa"},"created_at":"2022-11-13T12:04:05.000000Z","updated_at":"2022-11-13T12:04:35.000000Z"}}]

class Packages {
  Packages({
    num? id,
    num? providerId,
    Name? name,
    String? dateFrom,
    String? timeFrom,
    dynamic description,
    String? image,
    num? fees,
    String? startStationName,
    num? rate,
    List<Additionals>? additionals,
    List<Destinations>? destinations,
  }) {
    _id = id;
    _providerId = providerId;
    _name = name;
    _dateFrom = dateFrom;
    _timeFrom = timeFrom;
    _description = description;
    _image = image;
    _fees = fees;
    _startStationName = startStationName;
    _rate = rate;
    _additionals = additionals;
    _destinations = destinations;
  }

  Packages.fromJson(dynamic json) {
    _id = json['id'];
    _providerId = json['provider_id'];
    _name = json['name'] != null ? Name.fromJson(json['name']) : null;
    _dateFrom = json['date_from'];
    _timeFrom = json['time_from'];
    _description = json['description'];
    _image = json['image'];
    _fees = json['fees'];
    _startStationName = json['start_station_name'];
    _rate = json['rate'];
    if (json['additionals'] != null) {
      _additionals = [];
      json['additionals'].forEach((v) {
        _additionals?.add(Additionals.fromJson(v));
      });
    }
    if (json['destinations'] != null) {
      _destinations = [];
      json['destinations'].forEach((v) {
        _destinations?.add(Destinations.fromJson(v));
      });
    }
  }

  num? _id;
  num? _providerId;
  Name? _name;
  String? _dateFrom;
  String? _timeFrom;
  dynamic _description;
  String? _image;
  num? _fees;
  String? _startStationName;
  num? _rate;
  List<Additionals>? _additionals;
  List<Destinations>? _destinations;

  num? get id => _id;

  num? get providerId => _providerId;

  Name? get name => _name;

  String? get dateFrom => _dateFrom;

  String? get timeFrom => _timeFrom;

  dynamic get description => _description;

  String? get image => _image;

  num? get fees => _fees;

  String? get startStationName => _startStationName;

  num? get rate => _rate;

  List<Additionals>? get additionals => _additionals;

  List<Destinations>? get destinations => _destinations;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['provider_id'] = _providerId;
    if (_name != null) {
      map['name'] = _name?.toJson();
    }
    map['date_from'] = _dateFrom;
    map['time_from'] = _timeFrom;
    map['description'] = _description;
    map['image'] = _image;
    map['fees'] = _fees;
    map['start_station_name'] = _startStationName;
    map['rate'] = _rate;
    if (_additionals != null) {
      map['additionals'] = _additionals?.map((v) => v.toJson()).toList();
    }
    if (_destinations != null) {
      map['destinations'] = _destinations?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// id : 1
/// provider_id : 1
/// from_city_id : 4
/// to_city_id : 2
/// starting_terminal_id : 1
/// arrival_terminal_id : 2
/// stops : null
/// created_at : "2022-12-18T13:33:00.000000Z"
/// updated_at : "2022-12-18T13:33:00.000000Z"
/// name : "Alahsa - Makka"
/// from_city : {"id":4,"name":{"en":"Alahsa","ar":"الاحساء","ur":"alahsa"},"created_at":"2022-11-13T12:04:05.000000Z","updated_at":"2022-11-13T12:04:35.000000Z"}
/// to_city : {"id":2,"name":{"en":"Makka","ar":"مكة المكرمة","ur":"Makka"},"created_at":"2022-11-13T11:44:12.000000Z","updated_at":"2022-11-13T11:44:12.000000Z"}

class Destinations {
  Destinations({
    num? id,
    num? providerId,
    num? fromCityId,
    num? toCityId,
    num? startingTerminalId,
    num? arrivalTerminalId,
    dynamic stops,
    String? createdAt,
    String? updatedAt,
    String? name,
    FromCity? fromCity,
    ToCity? toCity,
  }) {
    _id = id;
    _providerId = providerId;
    _fromCityId = fromCityId;
    _toCityId = toCityId;
    _startingTerminalId = startingTerminalId;
    _arrivalTerminalId = arrivalTerminalId;
    _stops = stops;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _name = name;
    _fromCity = fromCity;
    _toCity = toCity;
  }

  Destinations.fromJson(dynamic json) {
    _id = json['id'];
    _providerId = json['provider_id'];
    _fromCityId = json['from_city_id'];
    _toCityId = json['to_city_id'];
    _startingTerminalId = json['starting_terminal_id'];
    _arrivalTerminalId = json['arrival_terminal_id'];
    _stops = json['stops'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _name = json['name'];
    _fromCity =
        json['from_city'] != null ? FromCity.fromJson(json['from_city']) : null;
    _toCity = json['to_city'] != null ? ToCity.fromJson(json['to_city']) : null;
  }

  num? _id;
  num? _providerId;
  num? _fromCityId;
  num? _toCityId;
  num? _startingTerminalId;
  num? _arrivalTerminalId;
  dynamic _stops;
  String? _createdAt;
  String? _updatedAt;
  String? _name;
  FromCity? _fromCity;
  ToCity? _toCity;

  num? get id => _id;

  num? get providerId => _providerId;

  num? get fromCityId => _fromCityId;

  num? get toCityId => _toCityId;

  num? get startingTerminalId => _startingTerminalId;

  num? get arrivalTerminalId => _arrivalTerminalId;

  dynamic get stops => _stops;

  String? get createdAt => _createdAt;

  String? get updatedAt => _updatedAt;

  String? get name => _name;

  FromCity? get fromCity => _fromCity;

  ToCity? get toCity => _toCity;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['provider_id'] = _providerId;
    map['from_city_id'] = _fromCityId;
    map['to_city_id'] = _toCityId;
    map['starting_terminal_id'] = _startingTerminalId;
    map['arrival_terminal_id'] = _arrivalTerminalId;
    map['stops'] = _stops;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['name'] = _name;
    if (_fromCity != null) {
      map['from_city'] = _fromCity?.toJson();
    }
    if (_toCity != null) {
      map['to_city'] = _toCity?.toJson();
    }
    return map;
  }
}

/// id : 2
/// name : {"en":"Makka","ar":"مكة المكرمة","ur":"Makka"}
/// created_at : "2022-11-13T11:44:12.000000Z"
/// updated_at : "2022-11-13T11:44:12.000000Z"

class ToCity {
  ToCity({
    num? id,
    Name? name,
    String? createdAt,
    String? updatedAt,
  }) {
    _id = id;
    _name = name;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  ToCity.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'] != null ? Name.fromJson(json['name']) : null;
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }

  num? _id;
  Name? _name;
  String? _createdAt;
  String? _updatedAt;

  num? get id => _id;

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

/// en : "Makka"
/// ar : "مكة المكرمة"
/// ur : "Makka"

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

/// id : 4
/// name : {"en":"Alahsa","ar":"الاحساء","ur":"alahsa"}
/// created_at : "2022-11-13T12:04:05.000000Z"
/// updated_at : "2022-11-13T12:04:35.000000Z"

class FromCity {
  FromCity({
    num? id,
    Name? name,
    String? createdAt,
    String? updatedAt,
  }) {
    _id = id;
    _name = name;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  FromCity.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'] != null ? Name.fromJson(json['name']) : null;
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }

  num? _id;
  Name? _name;
  String? _createdAt;
  String? _updatedAt;

  num? get id => _id;

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

/// id : 1
/// fees : 2
/// name : {"en":"شاي","ar":"شاي","ur":"tea"}

class Additionals {
  Additionals({
    num? id,
    num? fees,
    Name? name,
  }) {
    _id = id;
    _fees = fees;
    _name = name;
  }

  Additionals.fromJson(dynamic json) {
    _id = json['id'];
    _fees = json['fees'];
    _name = json['name'] != null ? Name.fromJson(json['name']) : null;
  }

  num? _id;
  num? _fees;
  Name? _name;

  num? get id => _id;

  num? get fees => _fees;

  Name? get name => _name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['fees'] = _fees;
    if (_name != null) {
      map['name'] = _name?.toJson();
    }
    return map;
  }
}
