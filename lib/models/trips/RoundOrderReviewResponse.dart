class RoundOrderReviewResponse {
  RoundOrderReviewResponse({
    int? code,
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

  int? _code;
  String? _message;
  Data? _data;

  int? get code => _code;

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

class Data {
  Data({
    List<TripOrders>? tripOrders,
  }) {
    _tripOrders = tripOrders;
  }

  Data.fromJson(dynamic json) {
    if (json['trip_orders'] != null) {
      _tripOrders = [];
      json['trip_orders'].forEach((v) {
        _tripOrders?.add(TripOrders.fromJson(v));
      });
    }
  }

  List<TripOrders>? _tripOrders;

  List<TripOrders>? get tripOrders => _tripOrders;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_tripOrders != null) {
      map['trip_orders'] = _tripOrders?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class TripOrders {
  TripOrders({
    int? count,
    FromCity? fromCity,
    ToCity? toCity,
    int? fees,
    String? timeFrom,
    String? timeTo,
    String? dateFrom,
    String? dateTo,
    List<HotelsRooms>? hotelsRooms,
    List<Additionals>? additionals,
    int? discount,
    int? tax,
    String? taxType,
    int? total,
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
    _discount = discount;
    _tax = tax;
    _taxType = taxType;
    _total = total;
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
    _discount = json['discount'];
    _tax = json['tax'];
    _taxType = json['tax_type'];
    _total = json['total'];
  }

  int? _count;
  FromCity? _fromCity;
  ToCity? _toCity;
  int? _fees;
  String? _timeFrom;
  String? _timeTo;
  String? _dateFrom;
  String? _dateTo;
  List<HotelsRooms>? _hotelsRooms;
  List<Additionals>? _additionals;
  int? _discount;
  int? _tax;
  String? _taxType;
  int? _total;

  int? get count => _count;

  FromCity? get fromCity => _fromCity;

  ToCity? get toCity => _toCity;

  int? get fees => _fees;

  String? get timeFrom => _timeFrom;

  String? get timeTo => _timeTo;

  String? get dateFrom => _dateFrom;

  String? get dateTo => _dateTo;

  List<HotelsRooms>? get hotelsRooms => _hotelsRooms;

  List<Additionals>? get additionals => _additionals;

  int? get discount => _discount;

  int? get tax => _tax;

  String? get taxType => _taxType;

  int? get total => _total;

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
    map['discount'] = _discount;
    map['tax'] = _tax;
    map['tax_type'] = _taxType;
    map['total'] = _total;
    return map;
  }
}

class Additionals {
  Additionals({
    int? id,
    int? fees,
    int? count,
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

  int? _id;
  int? _fees;
  int? _count;
  String? _name;

  int? get id => _id;

  int? get fees => _fees;

  int? get count => _count;

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

class HotelsRooms {
  HotelsRooms({
    int? days,
    Name? name,
    int? fees,
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

  int? _days;
  Name? _name;
  int? _fees;

  int? get days => _days;

  Name? get name => _name;

  int? get fees => _fees;

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