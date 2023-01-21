/// code : 1
/// message : "retrieved successfully."
/// data : {"trip_orders":[{"count":1,"from_city":{"name":{"en":"alahsa","ar":"الاحساء","ur":"alahsa"}},"to_city":{"name":{"en":"Makka","ar":"مكة المكرمة","ur":"Makka"}},"fees":299,"time_from":"06:00","time_to":"06:00","date_from":"2023-01-09","date_to":"2023-01-09","hotels_rooms":[{"days":2,"name":{"en":"Mina Concorde","ar":"منى كونكورد","ur":"Mina Concorde"},"fees":200}],"additionals":[{"id":1,"fees":10,"count":2,"name":"tea"}],"tax_type":"inclusive"},{"count":1,"from_city":{"name":{"en":"Makka","ar":"مكة المكرمة","ur":"Makka"}},"to_city":{"name":{"en":"alahsa","ar":"الاحساء","ur":"alahsa"}},"fees":298,"time_from":"07:00","time_to":"05:00","date_from":"2023-01-12","date_to":"2023-01-12","hotels_rooms":[{"days":2,"name":{"en":"Mina Concorde","ar":"منى كونكورد","ur":"Mina Concorde"},"fees":200}],"additionals":[{"id":1,"fees":15,"count":3,"name":"tea"}],"tax_type":"inclusive"}],"fees":597,"discount":0,"tax":93.3,"total":622.02}

class RoundOrderReviewResponse {
  RoundOrderReviewResponse({
    num? code,
    String? message,
    Data? data,
  }) {
    _code = code;
    _message = message;
    _data = data;
  }

  RoundOrderReviewResponse.fromJson(dynamic json) {
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

/// trip_orders : [{"count":1,"from_city":{"name":{"en":"alahsa","ar":"الاحساء","ur":"alahsa"}},"to_city":{"name":{"en":"Makka","ar":"مكة المكرمة","ur":"Makka"}},"fees":299,"time_from":"06:00","time_to":"06:00","date_from":"2023-01-09","date_to":"2023-01-09","hotels_rooms":[{"days":2,"name":{"en":"Mina Concorde","ar":"منى كونكورد","ur":"Mina Concorde"},"fees":200}],"additionals":[{"id":1,"fees":10,"count":2,"name":"tea"}],"tax_type":"inclusive"},{"count":1,"from_city":{"name":{"en":"Makka","ar":"مكة المكرمة","ur":"Makka"}},"to_city":{"name":{"en":"alahsa","ar":"الاحساء","ur":"alahsa"}},"fees":298,"time_from":"07:00","time_to":"05:00","date_from":"2023-01-12","date_to":"2023-01-12","hotels_rooms":[{"days":2,"name":{"en":"Mina Concorde","ar":"منى كونكورد","ur":"Mina Concorde"},"fees":200}],"additionals":[{"id":1,"fees":15,"count":3,"name":"tea"}],"tax_type":"inclusive"}]
/// fees : 597
/// discount : 0
/// tax : 93.3
/// total : 622.02

class Data {
  Data({
    List<TripOrders>? tripOrders,
    num? fees,
    num? discount,
    num? tax,
    num? total,
  }) {
    _tripOrders = tripOrders;
    _fees = fees;
    _discount = discount;
    _tax = tax;
    _total = total;
  }

  Data.fromJson(dynamic json) {
    if (json['trip_orders'] != null) {
      _tripOrders = [];
      json['trip_orders'].forEach((v) {
        _tripOrders?.add(TripOrders.fromJson(v));
      });
    }
    _fees = json['fees'];
    _discount = json['discount'];
    _tax = json['tax'];
    _total = json['total'];
  }

  List<TripOrders>? _tripOrders;
  num? _fees;
  num? _discount;
  num? _tax;
  num? _total;

  List<TripOrders>? get tripOrders => _tripOrders;

  num? get fees => _fees;

  num? get discount => _discount;

  num? get tax => _tax;

  num? get total => _total;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_tripOrders != null) {
      map['trip_orders'] = _tripOrders?.map((v) => v.toJson()).toList();
    }
    map['fees'] = _fees;
    map['discount'] = _discount;
    map['tax'] = _tax;
    map['total'] = _total;
    return map;
  }
}

/// count : 1
/// from_city : {"name":{"en":"alahsa","ar":"الاحساء","ur":"alahsa"}}
/// to_city : {"name":{"en":"Makka","ar":"مكة المكرمة","ur":"Makka"}}
/// fees : 299
/// time_from : "06:00"
/// time_to : "06:00"
/// date_from : "2023-01-09"
/// date_to : "2023-01-09"
/// hotels_rooms : [{"days":2,"name":{"en":"Mina Concorde","ar":"منى كونكورد","ur":"Mina Concorde"},"fees":200}]
/// additionals : [{"id":1,"fees":10,"count":2,"name":"tea"}]
/// tax_type : "inclusive"

class TripOrders {
  TripOrders({
    num? count,
    FromCity? fromCity,
    ToCity? toCity,
    num? fees,
    String? timeFrom,
    String? timeTo,
    String? dateFrom,
    String? dateTo,
    List<HotelsRooms>? hotelsRooms,
    List<Additionals>? additionals,
    String? taxType,
  }) {
    _count = count;
    _fromCity = fromCity;
    _toCity = toCity;
    _fees = fees;
    _timeFrom = timeFrom;
    _timeTo = timeTo;
    _dateFrom = dateFrom;
    _dateTo = dateTo;
    _hotelsRooms = hotelsRooms;
    _additionals = additionals;
    _taxType = taxType;
  }

  TripOrders.fromJson(dynamic json) {
    _count = json['count'];
    _fromCity =
        json['from_city'] != null ? FromCity.fromJson(json['from_city']) : null;
    _toCity = json['to_city'] != null ? ToCity.fromJson(json['to_city']) : null;
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
    _taxType = json['tax_type'];
  }

  num? _count;
  FromCity? _fromCity;
  ToCity? _toCity;
  num? _fees;
  String? _timeFrom;
  String? _timeTo;
  String? _dateFrom;
  String? _dateTo;
  List<HotelsRooms>? _hotelsRooms;
  List<Additionals>? _additionals;
  String? _taxType;

  num? get count => _count;

  FromCity? get fromCity => _fromCity;

  ToCity? get toCity => _toCity;

  num? get fees => _fees;

  String? get timeFrom => _timeFrom;

  String? get timeTo => _timeTo;

  String? get dateFrom => _dateFrom;

  String? get dateTo => _dateTo;

  List<HotelsRooms>? get hotelsRooms => _hotelsRooms;

  List<Additionals>? get additionals => _additionals;

  String? get taxType => _taxType;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['count'] = _count;
    if (_fromCity != null) {
      map['from_city'] = _fromCity?.toJson();
    }
    if (_toCity != null) {
      map['to_city'] = _toCity?.toJson();
    }
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
    map['tax_type'] = _taxType;
    return map;
  }
}

/// id : 1
/// fees : 10
/// count : 2
/// name : "tea"

class Additionals {
  Additionals({
    num? id,
    num? fees,
    num? count,
    String? name,
  }) {
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
/// fees : 200

class HotelsRooms {
  HotelsRooms({
    num? days,
    Name? name,
    num? fees,
  }) {
    _days = days;
    _name = name;
    _fees = fees;
  }

  HotelsRooms.fromJson(dynamic json) {
    _days = json['days'];
    _name = json['name'] != null ? Name.fromJson(json['name']) : null;
    _fees = json['fees'];
  }

  num? _days;
  Name? _name;
  num? _fees;

  num? get days => _days;

  Name? get name => _name;

  num? get fees => _fees;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['days'] = _days;
    if (_name != null) {
      map['name'] = _name?.toJson();
    }
    map['fees'] = _fees;
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

/// name : {"en":"Makka","ar":"مكة المكرمة","ur":"Makka"}

class ToCity {
  ToCity({
    Name? name,
  }) {
    _name = name;
  }

  ToCity.fromJson(dynamic json) {
    _name = json['name'] != null ? Name.fromJson(json['name']) : null;
  }

  Name? _name;

  Name? get name => _name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_name != null) {
      map['name'] = _name?.toJson();
    }
    return map;
  }
}

/// name : {"en":"alahsa","ar":"الاحساء","ur":"alahsa"}

class FromCity {
  FromCity({
    Name? name,
  }) {
    _name = name;
  }

  FromCity.fromJson(dynamic json) {
    _name = json['name'] != null ? Name.fromJson(json['name']) : null;
  }

  Name? _name;

  Name? get name => _name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_name != null) {
      map['name'] = _name?.toJson();
    }
    return map;
  }
}
