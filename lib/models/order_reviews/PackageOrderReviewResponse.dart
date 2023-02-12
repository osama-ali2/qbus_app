/// code : 1
/// message : "retrieved successfully."
/// data : {"count":2,"fees":1114,"time_from":"17:00","time_to":null,"date_from":"2023-03-08","date_to":"2023-03-08","hotels_rooms":[{"days":2,"name":{"en":"Mina Concorde","ar":"منى كونكورد","ur":"Mina Concorde"},"city_name":{"en":"Makka","ar":"مكة المكرمة","ur":"Makka"},"fees":200},{"days":2,"name":{"en":"Mina Concorde","ar":"منى كونكورد","ur":"Mina Concorde"},"city_name":{"en":"Makka","ar":"مكة المكرمة","ur":"Makka"},"fees":200},{"days":2,"name":{"en":"Mina Concorde","ar":"منى كونكورد","ur":"Mina Concorde"},"city_name":{"en":"Makka","ar":"مكة المكرمة","ur":"Makka"},"fees":200}],"additionals":[{"id":1,"fees":14,"count":2,"name":"شاي"}],"discount":0,"tax":167.1,"tax_type":"inclusive","total":1714}

class PackageOrderReviewResponse {
  PackageOrderReviewResponse({
      num? code, 
      String? message, 
      Data? data,}){
    _code = code;
    _message = message;
    _data = data;
}

  PackageOrderReviewResponse.fromJson(dynamic json) {
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

/// count : 2
/// fees : 1114
/// time_from : "17:00"
/// time_to : null
/// date_from : "2023-03-08"
/// date_to : "2023-03-08"
/// hotels_rooms : [{"days":2,"name":{"en":"Mina Concorde","ar":"منى كونكورد","ur":"Mina Concorde"},"city_name":{"en":"Makka","ar":"مكة المكرمة","ur":"Makka"},"fees":200},{"days":2,"name":{"en":"Mina Concorde","ar":"منى كونكورد","ur":"Mina Concorde"},"city_name":{"en":"Makka","ar":"مكة المكرمة","ur":"Makka"},"fees":200},{"days":2,"name":{"en":"Mina Concorde","ar":"منى كونكورد","ur":"Mina Concorde"},"city_name":{"en":"Makka","ar":"مكة المكرمة","ur":"Makka"},"fees":200}]
/// additionals : [{"id":1,"fees":14,"count":2,"name":"شاي"}]
/// discount : 0
/// tax : 167.1
/// tax_type : "inclusive"
/// total : 1714

class Data {
  Data({
      num? count, 
      num? fees, 
      String? timeFrom, 
      dynamic timeTo, 
      String? dateFrom, 
      String? dateTo, 
      List<HotelsRooms>? hotelsRooms, 
      List<Additionals>? additionals, 
      num? discount, 
      num? tax, 
      String? taxType, 
      num? total,}){
    _count = count;
    _fees = fees;
    _timeFrom = timeFrom;
    _timeTo = timeTo;
    _dateFrom = dateFrom;
    _dateTo = dateTo;
    _hotelsRooms = hotelsRooms;
    _additionals = additionals;
    _discount = discount;
    _tax = tax;
    _taxType = taxType;
    _total = total;
}

  Data.fromJson(dynamic json) {
    _count = json['count'];
    _fees = json['fees'];
    _timeFrom = json['time_from'];
    _timeTo = json['time_to'];
    _dateFrom = json['date_from'];
    _dateTo = json['date_to'];
    if (json['hotels_rooms'] != null) {
      _hotelsRooms = [];
      json['hotels_rooms'].forEach((v) {
        _hotelsRooms?.add(HotelsRooms.fromJson(v));
      });
    }
    if (json['additionals'] != null) {
      _additionals = [];
      json['additionals'].forEach((v) {
        _additionals?.add(Additionals.fromJson(v));
      });
    }
    _discount = json['discount'];
    _tax = json['tax'];
    _taxType = json['tax_type'];
    _total = json['total'];
  }
  num? _count;
  num? _fees;
  String? _timeFrom;
  dynamic _timeTo;
  String? _dateFrom;
  String? _dateTo;
  List<HotelsRooms>? _hotelsRooms;
  List<Additionals>? _additionals;
  num? _discount;
  num? _tax;
  String? _taxType;
  num? _total;

  num? get count => _count;
  num? get fees => _fees;
  String? get timeFrom => _timeFrom;
  dynamic get timeTo => _timeTo;
  String? get dateFrom => _dateFrom;
  String? get dateTo => _dateTo;
  List<HotelsRooms>? get hotelsRooms => _hotelsRooms;
  List<Additionals>? get additionals => _additionals;
  num? get discount => _discount;
  num? get tax => _tax;
  String? get taxType => _taxType;
  num? get total => _total;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['count'] = _count;
    map['fees'] = _fees;
    map['time_from'] = _timeFrom;
    map['time_to'] = _timeTo;
    map['date_from'] = _dateFrom;
    map['date_to'] = _dateTo;
    if (_hotelsRooms != null) {
      map['hotels_rooms'] = _hotelsRooms?.map((v) => v.toJson()).toList();
    }
    if (_additionals != null) {
      map['additionals'] = _additionals?.map((v) => v.toJson()).toList();
    }
    map['discount'] = _discount;
    map['tax'] = _tax;
    map['tax_type'] = _taxType;
    map['total'] = _total;
    return map;
  }

}

/// id : 1
/// fees : 14
/// count : 2
/// name : "شاي"

class Additionals {
  Additionals({
      num? id, 
      num? fees, 
      num? count, 
      String? name,}){
    _id = id;
    _fees = fees;
    _count = count;
    _name = name;
}

  Additionals.fromJson(dynamic json) {
    _id = json['id'];
    _fees = json['fees'];
    _count = json['count'];
    _name = json['name'];
  }
  num? _id;
  num? _fees;
  num? _count;
  String? _name;

  num? get id => _id;
  num? get fees => _fees;
  num? get count => _count;
  String? get name => _name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['fees'] = _fees;
    map['count'] = _count;
    map['name'] = _name;
    return map;
  }

}

/// days : 2
/// name : {"en":"Mina Concorde","ar":"منى كونكورد","ur":"Mina Concorde"}
/// city_name : {"en":"Makka","ar":"مكة المكرمة","ur":"Makka"}
/// fees : 200

class HotelsRooms {
  HotelsRooms({
      num? days, 
      Name? name, 
      CityName? cityName, 
      num? fees,}){
    _days = days;
    _name = name;
    _cityName = cityName;
    _fees = fees;
}

  HotelsRooms.fromJson(dynamic json) {
    _days = json['days'];
    _name = json['name'] != null ? Name.fromJson(json['name']) : null;
    _cityName = json['city_name'] != null ? CityName.fromJson(json['city_name']) : null;
    _fees = json['fees'];
  }
  num? _days;
  Name? _name;
  CityName? _cityName;
  num? _fees;

  num? get days => _days;
  Name? get name => _name;
  CityName? get cityName => _cityName;
  num? get fees => _fees;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['days'] = _days;
    if (_name != null) {
      map['name'] = _name?.toJson();
    }
    if (_cityName != null) {
      map['city_name'] = _cityName?.toJson();
    }
    map['fees'] = _fees;
    return map;
  }

}

/// en : "Makka"
/// ar : "مكة المكرمة"
/// ur : "Makka"

class CityName {
  CityName({
      String? en, 
      String? ar, 
      String? ur,}){
    _en = en;
    _ar = ar;
    _ur = ur;
}

  CityName.fromJson(dynamic json) {
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

/// en : "Mina Concorde"
/// ar : "منى كونكورد"
/// ur : "Mina Concorde"

class Name {
  Name({
      String? en, 
      String? ar, 
      String? ur,}){
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