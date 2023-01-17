/// message : "success"
/// code : 1
/// data : {"trips":[{"id":40,"provider_name":"مسرى الفاروق","time_from":"13:00","time_to":"14:00","start_station_name":{"en":"Al-Thalithiya","ar":"الثليثية","ur":"Al-Thalithiya"},"arrival_station_name":{"en":"North Azizia","ar":"العزيزية الشمالية","ur":"North Azizia"},"fees":100,"rate":0,"from_city_name":{"en":"alahsa","ar":"الاحساء","ur":"alahsa"},"to_city_name":{"en":"Makka","ar":"مكة المكرمة","ur":"Makka"},"stops":null,"additionals":[{"en":"tea","ar":"tea","ur":"tea"}],"hotels":[{"fees":"100","room_type":"2"},{"fees":"100","room_type":"3"},{"fees":"100","room_type":"7"},{"fees":"100","room_type":"8"},{"fees":"100","room_type":"9"},{"fees":"30","room_type":"10"}]}]}

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

/// trips : [{"id":40,"provider_name":"مسرى الفاروق","time_from":"13:00","time_to":"14:00","start_station_name":{"en":"Al-Thalithiya","ar":"الثليثية","ur":"Al-Thalithiya"},"arrival_station_name":{"en":"North Azizia","ar":"العزيزية الشمالية","ur":"North Azizia"},"fees":100,"rate":0,"from_city_name":{"en":"alahsa","ar":"الاحساء","ur":"alahsa"},"to_city_name":{"en":"Makka","ar":"مكة المكرمة","ur":"Makka"},"stops":null,"additionals":[{"en":"tea","ar":"tea","ur":"tea"}],"hotels":[{"fees":"100","room_type":"2"},{"fees":"100","room_type":"3"},{"fees":"100","room_type":"7"},{"fees":"100","room_type":"8"},{"fees":"100","room_type":"9"},{"fees":"30","room_type":"10"}]}]

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

/// id : 40
/// provider_name : "مسرى الفاروق"
/// time_from : "13:00"
/// time_to : "14:00"
/// start_station_name : {"en":"Al-Thalithiya","ar":"الثليثية","ur":"Al-Thalithiya"}
/// arrival_station_name : {"en":"North Azizia","ar":"العزيزية الشمالية","ur":"North Azizia"}
/// fees : 100
/// rate : 0
/// from_city_name : {"en":"alahsa","ar":"الاحساء","ur":"alahsa"}
/// to_city_name : {"en":"Makka","ar":"مكة المكرمة","ur":"Makka"}
/// stops : null
/// additionals : [{"en":"tea","ar":"tea","ur":"tea"}]
/// hotels : [{"fees":"100","room_type":"2"},{"fees":"100","room_type":"3"},{"fees":"100","room_type":"7"},{"fees":"100","room_type":"8"},{"fees":"100","room_type":"9"},{"fees":"30","room_type":"10"}]

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
    dynamic stops,
    List<Additionals>? additionals,
    List<Hotels>? hotels,
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
    _hotels = hotels;
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
    if (json['hotels'] != null) {
      _hotels = [];
      json['hotels'].forEach((v) {
        _hotels?.add(Hotels.fromJson(v));
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
  dynamic _stops;
  List<Additionals>? _additionals;
  List<Hotels>? _hotels;

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

  dynamic get stops => _stops;

  List<Additionals>? get additionals => _additionals;

  List<Hotels>? get hotels => _hotels;

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
    if (_hotels != null) {
      map['hotels'] = _hotels?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// fees : "100"
/// room_type : "2"

class Hotels {
  Hotels({
    String? fees,
    String? roomType,
  }) {
    _fees = fees;
    _roomType = roomType;
  }

  Hotels.fromJson(dynamic json) {
    _fees = json['fees'];
    _roomType = json['room_type'];
  }

  String? _fees;
  String? _roomType;

  String? get fees => _fees;

  String? get roomType => _roomType;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['fees'] = _fees;
    map['room_type'] = _roomType;
    return map;
  }
}

/// en : "tea"
/// ar : "tea"
/// ur : "tea"

class Additionals {
  Additionals({
    String? en,
    String? ar,
    String? ur,
  }) {
    _en = en;
    _ar = ar;
    _ur = ur;
  }

  Additionals.fromJson(dynamic json) {
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

/// en : "Makka"
/// ar : "مكة المكرمة"
/// ur : "Makka"

class ToCityName {
  ToCityName({
    String? en,
    String? ar,
    String? ur,
  }) {
    _en = en;
    _ar = ar;
    _ur = ur;
  }

  ToCityName.fromJson(dynamic json) {
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

/// en : "alahsa"
/// ar : "الاحساء"
/// ur : "alahsa"

class FromCityName {
  FromCityName({
    String? en,
    String? ar,
    String? ur,
  }) {
    _en = en;
    _ar = ar;
    _ur = ur;
  }

  FromCityName.fromJson(dynamic json) {
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

/// en : "North Azizia"
/// ar : "العزيزية الشمالية"
/// ur : "North Azizia"

class ArrivalStationName {
  ArrivalStationName({
    String? en,
    String? ar,
    String? ur,
  }) {
    _en = en;
    _ar = ar;
    _ur = ur;
  }

  ArrivalStationName.fromJson(dynamic json) {
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

/// en : "Al-Thalithiya"
/// ar : "الثليثية"
/// ur : "Al-Thalithiya"

class StartStationName {
  StartStationName({
    String? en,
    String? ar,
    String? ur,
  }) {
    _en = en;
    _ar = ar;
    _ur = ur;
  }

  StartStationName.fromJson(dynamic json) {
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
