class OrderReviewResponse {
  OrderReviewResponse({
    int? code,
    String? message,
    Data? data,
  }) {
    _code = code;
    _message = message;
    _data = data;
  }

  OrderReviewResponse.fromJson(dynamic json) {
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
    String? id,
    int? fees,
    String? count,
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

  String? _id;
  int? _fees;
  String? _count;
  String? _name;

  String? get id => _id;

  int? get fees => _fees;

  String? get count => _count;

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
    String? roomId,
    String? days,
    int? fees,
    Hotel? hotel,
  }) {
    _roomId = roomId;
    _days = days;
    _fees = fees;
    _hotel = hotel;
  }

  HotelsRooms.fromJson(dynamic json) {
    _roomId = json['room_id'];
    _days = json['days'];
    _fees = json['fees'];
    _hotel = json['hotel'] != null ? Hotel.fromJson(json['hotel']) : null;
  }

  String? _roomId;
  String? _days;
  int? _fees;
  Hotel? _hotel;

  String? get roomId => _roomId;

  String? get days => _days;

  int? get fees => _fees;

  Hotel? get hotel => _hotel;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['room_id'] = _roomId;
    map['days'] = _days;
    map['fees'] = _fees;
    if (_hotel != null) {
      map['hotel'] = _hotel?.toJson();
    }
    return map;
  }
}

class Hotel {
  Hotel({
    int? id,
    Name? name,
    String? createdAt,
    String? updatedAt,
    String? rating,
    String? active,
  }) {
    _id = id;
    _name = name;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _rating = rating;
    _active = active;
  }

  Hotel.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'] != null ? Name.fromJson(json['name']) : null;
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _rating = json['rating'];
    _active = json['active'];
  }

  int? _id;
  Name? _name;
  String? _createdAt;
  String? _updatedAt;
  String? _rating;
  String? _active;

  int? get id => _id;

  Name? get name => _name;

  String? get createdAt => _createdAt;

  String? get updatedAt => _updatedAt;

  String? get rating => _rating;

  String? get active => _active;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    if (_name != null) {
      map['name'] = _name?.toJson();
    }
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['rating'] = _rating;
    map['active'] = _active;
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
