/// message : "success"
/// code : 1
/// data : {"trips":[{"id":34,"provider_name":"Provider1","time_from":"10:00","time_to":"17:00","start_station_name":{"ar":"محطة أ","en":"Station A"},"arrival_station_name":{"ar":"محطة ب","en":"Station B"},"fees":50,"rate":0,"from_city_name":{"ar":"عجمان","en":"Ajman","ur":"Ajman"},"to_city_name":{"ar":"الشارقة","en":"Sharjah","ur":"Sharjah"},"stops":1,"additionals":[{"ar":"وجبة","en":"Meal"},{"ar":"انترنت","en":"Internet"}]},{"id":35,"provider_name":"Provider1","time_from":"16:00","time_to":"17:00","start_station_name":{"ar":"محطة أ","en":"Station A"},"arrival_station_name":{"ar":"محطة ب","en":"Station B"},"fees":19,"rate":0,"from_city_name":{"ar":"عجمان","en":"Ajman","ur":"Ajman"},"to_city_name":{"ar":"الشارقة","en":"Sharjah","ur":"Sharjah"},"stops":1,"additionals":[{"ar":"انترنت","en":"Internet"}]},{"id":38,"provider_name":"Provider1","time_from":"07:00","time_to":"09:00","start_station_name":{"ar":"محطة أ","en":"Station A"},"arrival_station_name":{"ar":"محطة ب","en":"Station B"},"fees":29,"rate":0,"from_city_name":{"ar":"عجمان","en":"Ajman","ur":"Ajman"},"to_city_name":{"ar":"الشارقة","en":"Sharjah","ur":"Sharjah"},"stops":1,"additionals":[{"ar":"فندق","en":"Hotel"},{"ar":"وجبة","en":"Meal"}]},{"id":39,"provider_name":"Provider1","time_from":"10:00","time_to":"11:00","start_station_name":{"ar":"محطة أ","en":"Station A"},"arrival_station_name":{"ar":"محطة أ","en":"Station A"},"fees":20,"rate":0,"from_city_name":{"ar":"دبي","en":"Dubai","ur":"Dubai"},"to_city_name":{"ar":"الشارقة","en":"Sharjah","ur":"Sharjah"},"stops":1,"additionals":[{"ar":"فندق","en":"Hotel"}]},{"id":40,"provider_name":"Provider1","time_from":"10:00","time_to":"11:00","start_station_name":{"ar":"محطة أ","en":"Station A"},"arrival_station_name":{"ar":"محطة أ","en":"Station A"},"fees":29,"rate":0,"from_city_name":{"ar":"دبي","en":"Dubai","ur":"Dubai"},"to_city_name":{"ar":"العين","en":"Al Ain","ur":"Al Ain"},"stops":1,"additionals":[{"ar":"وجبة","en":"Meal"}]},{"id":41,"provider_name":"Provider1","time_from":"11:17","time_to":"16:17","start_station_name":{"ar":"محطة أ","en":"Station A"},"arrival_station_name":{"ar":"محطة أ","en":"Station A"},"fees":1400,"rate":0,"from_city_name":{"ar":"دبي","en":"Dubai","ur":"Dubai"},"to_city_name":{"ar":"الشارقة","en":"Sharjah","ur":"Sharjah"},"stops":1,"additionals":[]},{"id":42,"provider_name":"Provider1","time_from":"11:35","time_to":"16:35","start_station_name":{"ar":"محطة أ","en":"Station A"},"arrival_station_name":{"ar":"محطة ب","en":"Station B"},"fees":700,"rate":0,"from_city_name":{"ar":"عجمان","en":"Ajman","ur":"Ajman"},"to_city_name":{"ar":"الشارقة","en":"Sharjah","ur":"Sharjah"},"stops":1,"additionals":[]}]}

class TripsResponse {
  TripsResponse({
    String? message,
    int? code,
    Data? data,
  }) {
    _message = message;
    _code = code;
    _data = data;
  }

  TripsResponse.fromJson(dynamic json) {
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

/// trips : [{"id":34,"provider_name":"Provider1","time_from":"10:00","time_to":"17:00","start_station_name":{"ar":"محطة أ","en":"Station A"},"arrival_station_name":{"ar":"محطة ب","en":"Station B"},"fees":50,"rate":0,"from_city_name":{"ar":"عجمان","en":"Ajman","ur":"Ajman"},"to_city_name":{"ar":"الشارقة","en":"Sharjah","ur":"Sharjah"},"stops":1,"additionals":[{"ar":"وجبة","en":"Meal"},{"ar":"انترنت","en":"Internet"}]},{"id":35,"provider_name":"Provider1","time_from":"16:00","time_to":"17:00","start_station_name":{"ar":"محطة أ","en":"Station A"},"arrival_station_name":{"ar":"محطة ب","en":"Station B"},"fees":19,"rate":0,"from_city_name":{"ar":"عجمان","en":"Ajman","ur":"Ajman"},"to_city_name":{"ar":"الشارقة","en":"Sharjah","ur":"Sharjah"},"stops":1,"additionals":[{"ar":"انترنت","en":"Internet"}]},{"id":38,"provider_name":"Provider1","time_from":"07:00","time_to":"09:00","start_station_name":{"ar":"محطة أ","en":"Station A"},"arrival_station_name":{"ar":"محطة ب","en":"Station B"},"fees":29,"rate":0,"from_city_name":{"ar":"عجمان","en":"Ajman","ur":"Ajman"},"to_city_name":{"ar":"الشارقة","en":"Sharjah","ur":"Sharjah"},"stops":1,"additionals":[{"ar":"فندق","en":"Hotel"},{"ar":"وجبة","en":"Meal"}]},{"id":39,"provider_name":"Provider1","time_from":"10:00","time_to":"11:00","start_station_name":{"ar":"محطة أ","en":"Station A"},"arrival_station_name":{"ar":"محطة أ","en":"Station A"},"fees":20,"rate":0,"from_city_name":{"ar":"دبي","en":"Dubai","ur":"Dubai"},"to_city_name":{"ar":"الشارقة","en":"Sharjah","ur":"Sharjah"},"stops":1,"additionals":[{"ar":"فندق","en":"Hotel"}]},{"id":40,"provider_name":"Provider1","time_from":"10:00","time_to":"11:00","start_station_name":{"ar":"محطة أ","en":"Station A"},"arrival_station_name":{"ar":"محطة أ","en":"Station A"},"fees":29,"rate":0,"from_city_name":{"ar":"دبي","en":"Dubai","ur":"Dubai"},"to_city_name":{"ar":"العين","en":"Al Ain","ur":"Al Ain"},"stops":1,"additionals":[{"ar":"وجبة","en":"Meal"}]},{"id":41,"provider_name":"Provider1","time_from":"11:17","time_to":"16:17","start_station_name":{"ar":"محطة أ","en":"Station A"},"arrival_station_name":{"ar":"محطة أ","en":"Station A"},"fees":1400,"rate":0,"from_city_name":{"ar":"دبي","en":"Dubai","ur":"Dubai"},"to_city_name":{"ar":"الشارقة","en":"Sharjah","ur":"Sharjah"},"stops":1,"additionals":[]},{"id":42,"provider_name":"Provider1","time_from":"11:35","time_to":"16:35","start_station_name":{"ar":"محطة أ","en":"Station A"},"arrival_station_name":{"ar":"محطة ب","en":"Station B"},"fees":700,"rate":0,"from_city_name":{"ar":"عجمان","en":"Ajman","ur":"Ajman"},"to_city_name":{"ar":"الشارقة","en":"Sharjah","ur":"Sharjah"},"stops":1,"additionals":[]}]

class Data {
  Data({
    List<Trips>? trips,
  }) {
    _trips = trips;
  }

  Data.fromJson(dynamic json) {
    if (json['trips'] != null) {
      _trips = [];
      json['trips'].forEach((v) {
        _trips?.add(Trips.fromJson(v));
      });
    }
  }

  List<Trips>? _trips;

  List<Trips>? get trips => _trips;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_trips != null) {
      map['trips'] = _trips?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// id : 34
/// provider_name : "Provider1"
/// time_from : "10:00"
/// time_to : "17:00"
/// start_station_name : {"ar":"محطة أ","en":"Station A"}
/// arrival_station_name : {"ar":"محطة ب","en":"Station B"}
/// fees : 50
/// rate : 0
/// from_city_name : {"ar":"عجمان","en":"Ajman","ur":"Ajman"}
/// to_city_name : {"ar":"الشارقة","en":"Sharjah","ur":"Sharjah"}
/// stops : 1
/// additionals : [{"ar":"وجبة","en":"Meal"},{"ar":"انترنت","en":"Internet"}]

class Trips {
  Trips({
    int? id,
    String? providerName,
    String? timeFrom,
    String? timeTo,
    StartStationName? startStationName,
    ArrivalStationName? arrivalStationName,
    int? fees,
    int? rate,
    FromCityName? fromCityName,
    ToCityName? toCityName,
    int? stops,
    List<Additionals>? additionals,
  }) {
    _id = id;
    _providerName = providerName;
    _timeFrom = timeFrom;
    _timeTo = timeTo;
    _startStationName = startStationName;
    _arrivalStationName = arrivalStationName;
    _fees = fees;
    _rate = rate;
    _fromCityName = fromCityName;
    _toCityName = toCityName;
    _stops = stops;
    _additionals = additionals;
  }

  Trips.fromJson(dynamic json) {
    _id = json['id'];
    _providerName = json['provider_name'];
    _timeFrom = json['time_from'];
    _timeTo = json['time_to'];
    _startStationName = json['start_station_name'] != null
        ? StartStationName.fromJson(json['start_station_name'])
        : null;
    _arrivalStationName = json['arrival_station_name'] != null
        ? ArrivalStationName.fromJson(json['arrival_station_name'])
        : null;
    _fees = json['fees'];
    _rate = json['rate'];
    _fromCityName = json['from_city_name'] != null
        ? FromCityName.fromJson(json['from_city_name'])
        : null;
    _toCityName = json['to_city_name'] != null
        ? ToCityName.fromJson(json['to_city_name'])
        : null;
    _stops = json['stops'];
    if (json['additionals'] != null) {
      _additionals = [];
      json['additionals'].forEach((v) {
        _additionals?.add(Additionals.fromJson(v));
      });
    }
  }

  int? _id;
  String? _providerName;
  String? _timeFrom;
  String? _timeTo;
  StartStationName? _startStationName;
  ArrivalStationName? _arrivalStationName;
  int? _fees;
  int? _rate;
  FromCityName? _fromCityName;
  ToCityName? _toCityName;
  int? _stops;
  List<Additionals>? _additionals;

  int? get id => _id;

  String? get providerName => _providerName;

  String? get timeFrom => _timeFrom;

  String? get timeTo => _timeTo;

  StartStationName? get startStationName => _startStationName;

  ArrivalStationName? get arrivalStationName => _arrivalStationName;

  int? get fees => _fees;

  int? get rate => _rate;

  FromCityName? get fromCityName => _fromCityName;

  ToCityName? get toCityName => _toCityName;

  int? get stops => _stops;

  List<Additionals>? get additionals => _additionals;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['provider_name'] = _providerName;
    map['time_from'] = _timeFrom;
    map['time_to'] = _timeTo;
    if (_startStationName != null) {
      map['start_station_name'] = _startStationName?.toJson();
    }
    if (_arrivalStationName != null) {
      map['arrival_station_name'] = _arrivalStationName?.toJson();
    }
    map['fees'] = _fees;
    map['rate'] = _rate;
    if (_fromCityName != null) {
      map['from_city_name'] = _fromCityName?.toJson();
    }
    if (_toCityName != null) {
      map['to_city_name'] = _toCityName?.toJson();
    }
    map['stops'] = _stops;
    if (_additionals != null) {
      map['additionals'] = _additionals?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// ar : "وجبة"
/// en : "Meal"

class Additionals {
  Additionals({
    String? ar,
    String? en,
  }) {
    _ar = ar;
    _en = en;
  }

  Additionals.fromJson(dynamic json) {
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

/// ar : "الشارقة"
/// en : "Sharjah"
/// ur : "Sharjah"

class ToCityName {
  ToCityName({
    String? ar,
    String? en,
    String? ur,
  }) {
    _ar = ar;
    _en = en;
    _ur = ur;
  }

  ToCityName.fromJson(dynamic json) {
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

/// ar : "عجمان"
/// en : "Ajman"
/// ur : "Ajman"

class FromCityName {
  FromCityName({
    String? ar,
    String? en,
    String? ur,
  }) {
    _ar = ar;
    _en = en;
    _ur = ur;
  }

  FromCityName.fromJson(dynamic json) {
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

/// ar : "محطة ب"
/// en : "Station B"

class ArrivalStationName {
  ArrivalStationName({
    String? ar,
    String? en,
  }) {
    _ar = ar;
    _en = en;
  }

  ArrivalStationName.fromJson(dynamic json) {
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

/// ar : "محطة أ"
/// en : "Station A"

class StartStationName {
  StartStationName({
    String? ar,
    String? en,
  }) {
    _ar = ar;
    _en = en;
  }

  StartStationName.fromJson(dynamic json) {
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
