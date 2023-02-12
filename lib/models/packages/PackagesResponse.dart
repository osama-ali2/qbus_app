/// message : "success"
/// code : 1
/// data : {"packages":[{"id":1,"provider_name":"","name":"allhotels okay","description":"","image":"1676112646_25886297314266_n.jpg","destinations":["5","7","1"],"first_trip_id":63,"second_trip_id":45,"destinations_move_dates":["2023-03-10","2023-03-10",""],"destinations_move_times":["05:00","13:00","17:00"],"fees":250,"starting_city_id":2,"date_from":"2023-03-10","date_to":"2023-03-08","time_from":"17:00","time_to":"","provider_notes":"","provider_archive":false,"auto_approve":true,"additional":[{"id":"1","fees":"7"}],"rate":0,"hotel_room_trip_one":[{"fees":"2","room_type":"2"}],"hotel_room_trip_two":[{"fees":"100","room_type":"2"},{"fees":"100","room_type":"3"},{"fees":"100","room_type":"7"},{"fees":"100","room_type":"8"},{"fees":"100","room_type":"9"},{"fees":"30","room_type":"10"}],"created_at":"2023-02-11T10:50:46.000000Z","updated_at":"2023-02-11T12:27:27.000000Z"},{"id":4,"provider_name":"","name":"hotel_room_trip_one empty","description":"","image":"1676112646_25886297314266_n.jpg","destinations":["2","8","1"],"first_trip_id":62,"second_trip_id":46,"destinations_move_dates":["2023-03-10","2023-03-10",""],"destinations_move_times":["05:00","13:00","17:00"],"fees":260,"starting_city_id":2,"date_from":"2023-03-10","date_to":"2023-03-08","time_from":"17:00","time_to":"","provider_notes":"","provider_archive":false,"auto_approve":true,"additional":[{"id":"1","fees":"7"}],"rate":0,"hotel_room_trip_one":[],"hotel_room_trip_two":[{"fees":"2","room_type":"2"}],"created_at":"2023-02-11T10:50:46.000000Z","updated_at":"2023-02-11T12:31:58.000000Z"},{"id":5,"provider_name":"","name":"hotel_room_trip_two empty","description":"","image":"1676112646_25886297314266_n.jpg","destinations":["1","6","8"],"first_trip_id":61,"second_trip_id":64,"destinations_move_dates":["2023-03-10","2023-03-10",""],"destinations_move_times":["05:00","13:00","17:00"],"fees":280,"starting_city_id":2,"date_from":"2023-03-10","date_to":"2023-03-08","time_from":"17:00","time_to":"","provider_notes":"","provider_archive":false,"auto_approve":true,"additional":[{"id":"1","fees":"7"}],"rate":0,"hotel_room_trip_one":[{"fees":"100","room_type":"2"},{"fees":"100","room_type":"3"},{"fees":"100","room_type":"7"},{"fees":"100","room_type":"8"},{"fees":"100","room_type":"9"},{"fees":"30","room_type":"10"}],"hotel_room_trip_two":[],"created_at":"2023-02-11T10:50:46.000000Z","updated_at":"2023-02-11T12:34:20.000000Z"}],"image_base":"https://qbus-sa.com/public/images/packages"}

class PackagesResponse {
  PackagesResponse({
    String? message,
    int? code,
    Data? data,
  }) {
    _message = message;
    _code = code;
    _data = data;
  }

  PackagesResponse.fromJson(dynamic json) {
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

/// packages : [{"id":1,"provider_name":"","name":"allhotels okay","description":"","image":"1676112646_25886297314266_n.jpg","destinations":["5","7","1"],"first_trip_id":63,"second_trip_id":45,"destinations_move_dates":["2023-03-10","2023-03-10",""],"destinations_move_times":["05:00","13:00","17:00"],"fees":250,"starting_city_id":2,"date_from":"2023-03-10","date_to":"2023-03-08","time_from":"17:00","time_to":"","provider_notes":"","provider_archive":false,"auto_approve":true,"additional":[{"id":"1","fees":"7"}],"rate":0,"hotel_room_trip_one":[{"fees":"2","room_type":"2"}],"hotel_room_trip_two":[{"fees":"100","room_type":"2"},{"fees":"100","room_type":"3"},{"fees":"100","room_type":"7"},{"fees":"100","room_type":"8"},{"fees":"100","room_type":"9"},{"fees":"30","room_type":"10"}],"created_at":"2023-02-11T10:50:46.000000Z","updated_at":"2023-02-11T12:27:27.000000Z"},{"id":4,"provider_name":"","name":"hotel_room_trip_one empty","description":"","image":"1676112646_25886297314266_n.jpg","destinations":["2","8","1"],"first_trip_id":62,"second_trip_id":46,"destinations_move_dates":["2023-03-10","2023-03-10",""],"destinations_move_times":["05:00","13:00","17:00"],"fees":260,"starting_city_id":2,"date_from":"2023-03-10","date_to":"2023-03-08","time_from":"17:00","time_to":"","provider_notes":"","provider_archive":false,"auto_approve":true,"additional":[{"id":"1","fees":"7"}],"rate":0,"hotel_room_trip_one":[],"hotel_room_trip_two":[{"fees":"2","room_type":"2"}],"created_at":"2023-02-11T10:50:46.000000Z","updated_at":"2023-02-11T12:31:58.000000Z"},{"id":5,"provider_name":"","name":"hotel_room_trip_two empty","description":"","image":"1676112646_25886297314266_n.jpg","destinations":["1","6","8"],"first_trip_id":61,"second_trip_id":64,"destinations_move_dates":["2023-03-10","2023-03-10",""],"destinations_move_times":["05:00","13:00","17:00"],"fees":280,"starting_city_id":2,"date_from":"2023-03-10","date_to":"2023-03-08","time_from":"17:00","time_to":"","provider_notes":"","provider_archive":false,"auto_approve":true,"additional":[{"id":"1","fees":"7"}],"rate":0,"hotel_room_trip_one":[{"fees":"100","room_type":"2"},{"fees":"100","room_type":"3"},{"fees":"100","room_type":"7"},{"fees":"100","room_type":"8"},{"fees":"100","room_type":"9"},{"fees":"30","room_type":"10"}],"hotel_room_trip_two":[],"created_at":"2023-02-11T10:50:46.000000Z","updated_at":"2023-02-11T12:34:20.000000Z"}]
/// image_base : "https://qbus-sa.com/public/images/packages"

class Data {
  Data({
    List<Packages>? packages,
    String? imageBase,
  }) {
    _packages = packages;
    _imageBase = imageBase;
  }

  Data.fromJson(dynamic json) {
    if (json['packages'] != null) {
      _packages = [];
      json['packages'].forEach((v) {
        _packages?.add(Packages.fromJson(v));
      });
    }
    _imageBase = json['image_base'];
  }

  List<Packages>? _packages;
  String? _imageBase;

  List<Packages>? get packages => _packages;

  String? get imageBase => _imageBase;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_packages != null) {
      map['packages'] = _packages?.map((v) => v.toJson()).toList();
    }
    map['image_base'] = _imageBase;
    return map;
  }
}

/// id : 1
/// provider_name : ""
/// name : "allhotels okay"
/// description : ""
/// image : "1676112646_25886297314266_n.jpg"
/// destinations : ["5","7","1"]
/// first_trip_id : 63
/// second_trip_id : 45
/// destinations_move_dates : ["2023-03-10","2023-03-10",""]
/// destinations_move_times : ["05:00","13:00","17:00"]
/// fees : 250
/// starting_city_id : 2
/// date_from : "2023-03-10"
/// date_to : "2023-03-08"
/// time_from : "17:00"
/// time_to : ""
/// provider_notes : ""
/// provider_archive : false
/// auto_approve : true
/// additional : [{"id":"1","fees":"7"}]
/// rate : 0
/// hotel_room_trip_one : [{"fees":"2","room_type":"2"}]
/// hotel_room_trip_two : [{"fees":"100","room_type":"2"},{"fees":"100","room_type":"3"},{"fees":"100","room_type":"7"},{"fees":"100","room_type":"8"},{"fees":"100","room_type":"9"},{"fees":"30","room_type":"10"}]
/// created_at : "2023-02-11T10:50:46.000000Z"
/// updated_at : "2023-02-11T12:27:27.000000Z"

class Packages {
  Packages({
    int? id,
    String? providerName,
    String? name,
    String? description,
    String? image,
    List<String>? destinations,
    int? firstTripId,
    int? secondTripId,
    List<String>? destinationsMoveDates,
    List<String>? destinationsMoveTimes,
    int? fees,
    int? startingCityId,
    String? dateFrom,
    String? dateTo,
    String? timeFrom,
    String? timeTo,
    String? providerNotes,
    bool? providerArchive,
    bool? autoApprove,
    List<Additional>? additional,
    int? rate,
    List<HotelRoomTripOne>? hotelRoomTripOne,
    List<HotelRoomTripTwo>? hotelRoomTripTwo,
    String? createdAt,
    String? updatedAt,
  }) {
    _id = id;
    _providerName = providerName;
    _name = name;
    _description = description;
    _image = image;
    _destinations = destinations;
    _firstTripId = firstTripId;
    _secondTripId = secondTripId;
    _destinationsMoveDates = destinationsMoveDates;
    _destinationsMoveTimes = destinationsMoveTimes;
    _fees = fees;
    _startingCityId = startingCityId;
    _dateFrom = dateFrom;
    _dateTo = dateTo;
    _timeFrom = timeFrom;
    _timeTo = timeTo;
    _providerNotes = providerNotes;
    _providerArchive = providerArchive;
    _autoApprove = autoApprove;
    _additional = additional;
    _rate = rate;
    _hotelRoomTripOne = hotelRoomTripOne;
    _hotelRoomTripTwo = hotelRoomTripTwo;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  Packages.fromJson(dynamic json) {
    _id = json['id'];
    _providerName = json['provider_name'];
    _name = json['name'];
    _description = json['description'];
    _image = json['image'];
    _destinations =
        json['destinations'] != null ? json['destinations'].cast<String>() : [];
    _firstTripId = json['first_trip_id'];
    _secondTripId = json['second_trip_id'];
    _destinationsMoveDates = json['destinations_move_dates'] != null
        ? json['destinations_move_dates'].cast<String>()
        : [];
    _destinationsMoveTimes = json['destinations_move_times'] != null
        ? json['destinations_move_times'].cast<String>()
        : [];
    _fees = json['fees'];
    _startingCityId = json['starting_city_id'];
    _dateFrom = json['date_from'];
    _dateTo = json['date_to'];
    _timeFrom = json['time_from'];
    _timeTo = json['time_to'];
    _providerNotes = json['provider_notes'];
    _providerArchive = json['provider_archive'];
    _autoApprove = json['auto_approve'];
    if (json['additional'] != null) {
      _additional = [];
      json['additional'].forEach((v) {
        _additional?.add(Additional.fromJson(v));
      });
    }
    _rate = json['rate'];
    if (json['hotel_room_trip_one'] != null) {
      _hotelRoomTripOne = [];
      json['hotel_room_trip_one'].forEach((v) {
        _hotelRoomTripOne?.add(HotelRoomTripOne.fromJson(v));
      });
    }
    if (json['hotel_room_trip_two'] != null) {
      _hotelRoomTripTwo = [];
      json['hotel_room_trip_two'].forEach((v) {
        _hotelRoomTripTwo?.add(HotelRoomTripTwo.fromJson(v));
      });
    }
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }

  int? _id;
  String? _providerName;
  String? _name;
  String? _description;
  String? _image;
  List<String>? _destinations;
  int? _firstTripId;
  int? _secondTripId;
  List<String>? _destinationsMoveDates;
  List<String>? _destinationsMoveTimes;
  int? _fees;
  int? _startingCityId;
  String? _dateFrom;
  String? _dateTo;
  String? _timeFrom;
  String? _timeTo;
  String? _providerNotes;
  bool? _providerArchive;
  bool? _autoApprove;
  List<Additional>? _additional;
  int? _rate;
  List<HotelRoomTripOne>? _hotelRoomTripOne;
  List<HotelRoomTripTwo>? _hotelRoomTripTwo;
  String? _createdAt;
  String? _updatedAt;

  int? get id => _id;

  String? get providerName => _providerName;

  String? get name => _name;

  String? get description => _description;

  String? get image => _image;

  List<String>? get destinations => _destinations;

  int? get firstTripId => _firstTripId;

  int? get secondTripId => _secondTripId;

  List<String>? get destinationsMoveDates => _destinationsMoveDates;

  List<String>? get destinationsMoveTimes => _destinationsMoveTimes;

  int? get fees => _fees;

  int? get startingCityId => _startingCityId;

  String? get dateFrom => _dateFrom;

  String? get dateTo => _dateTo;

  String? get timeFrom => _timeFrom;

  String? get timeTo => _timeTo;

  String? get providerNotes => _providerNotes;

  bool? get providerArchive => _providerArchive;

  bool? get autoApprove => _autoApprove;

  List<Additional>? get additional => _additional;

  int? get rate => _rate;

  List<HotelRoomTripOne>? get hotelRoomTripOne => _hotelRoomTripOne;

  List<HotelRoomTripTwo>? get hotelRoomTripTwo => _hotelRoomTripTwo;

  String? get createdAt => _createdAt;

  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['provider_name'] = _providerName;
    map['name'] = _name;
    map['description'] = _description;
    map['image'] = _image;
    map['destinations'] = _destinations;
    map['first_trip_id'] = _firstTripId;
    map['second_trip_id'] = _secondTripId;
    map['destinations_move_dates'] = _destinationsMoveDates;
    map['destinations_move_times'] = _destinationsMoveTimes;
    map['fees'] = _fees;
    map['starting_city_id'] = _startingCityId;
    map['date_from'] = _dateFrom;
    map['date_to'] = _dateTo;
    map['time_from'] = _timeFrom;
    map['time_to'] = _timeTo;
    map['provider_notes'] = _providerNotes;
    map['provider_archive'] = _providerArchive;
    map['auto_approve'] = _autoApprove;
    if (_additional != null) {
      map['additional'] = _additional?.map((v) => v.toJson()).toList();
    }
    map['rate'] = _rate;
    if (_hotelRoomTripOne != null) {
      map['hotel_room_trip_one'] =
          _hotelRoomTripOne?.map((v) => v.toJson()).toList();
    }
    if (_hotelRoomTripTwo != null) {
      map['hotel_room_trip_two'] =
          _hotelRoomTripTwo?.map((v) => v.toJson()).toList();
    }
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }
}

/// fees : "100"
/// room_type : "2"

class HotelRoomTripTwo {
  HotelRoomTripTwo({
    String? fees,
    String? roomType,
  }) {
    _fees = fees;
    _roomType = roomType;
  }

  HotelRoomTripTwo.fromJson(dynamic json) {
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

/// fees : "2"
/// room_type : "2"

class HotelRoomTripOne {
  HotelRoomTripOne({
    String? fees,
    String? roomType,
  }) {
    _fees = fees;
    _roomType = roomType;
  }

  HotelRoomTripOne.fromJson(dynamic json) {
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

/// id : "1"
/// fees : "7"

class Additional {
  Additional({
    String? id,
    String? fees,
  }) {
    _id = id;
    _fees = fees;
  }

  Additional.fromJson(dynamic json) {
    _id = json['id'];
    _fees = json['fees'];
  }

  String? _id;
  String? _fees;

  String? get id => _id;

  String? get fees => _fees;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['fees'] = _fees;
    return map;
  }
}
