/// message : "success"
/// code : 1
/// data : {"packages":[{"id":1,"provider_id":1,"name":{"en":"مكة مدينة","ar":"مكة مدينة","ur":"مكة مدينة"},"description":"","image":"1671479582_كعبة.jpg","destinations":["1","5","6"],"trips":["61","61","61"],"destinations_move_dates":["2023-12-19","2022-01-22",""],"destinations_move_times":["14:00","21:00","13:30"],"fees":150,"starting_city_id":4,"date_from":"2023-12-19","date_to":"2022-12-23","time_from":"14:00","provider_notes":"","provider_archive":false,"auto_approve":true,"additional":[{"id":"1","fees":"2"}],"rate":0,"created_at":"2022-12-19T19:53:02.000000Z","updated_at":"2023-02-08T12:35:47.000000Z"},{"id":2,"provider_id":1,"name":{"en":"مكة مدينة","ar":"مكة مدينة","ur":"مكة مدينة"},"description":"","image":"1671655050_كعبة.jpg","destinations":["1","5","6"],"trips":["8","5","6"],"destinations_move_dates":["2022-12-22","2022-12-22","2022-12-23"],"destinations_move_times":["14:00","21:00","13:30"],"fees":150,"starting_city_id":4,"date_from":"2022-12-21","date_to":"2022-12-23","time_from":"14:00","provider_notes":"","provider_archive":false,"auto_approve":true,"additional":[],"rate":0,"created_at":"2022-12-21T20:37:30.000000Z","updated_at":"2022-12-21T20:37:30.000000Z"},{"id":3,"provider_id":1,"name":{"en":"مكة عمرة  وزيارة المدينة المنورة","ar":"مكة عمرة وزيارة المدينة المنورة","ur":"مكة عمرة وزيارة المدينة المنورة"},"description":"","image":"1671882946_278-الكعبة.jpg","destinations":["1","5","6"],"trips":["9","13","14"],"destinations_move_dates":["2022-12-26","2022-12-29","2022-12-30"],"destinations_move_times":["14:00","21:00","14:00"],"fees":150,"starting_city_id":4,"date_from":"2022-12-26","date_to":"2022-12-26","time_from":"14:00","provider_notes":"","provider_archive":false,"auto_approve":true,"additional":[],"rate":0,"created_at":"2022-12-24T11:55:46.000000Z","updated_at":"2022-12-24T11:55:46.000000Z"},{"id":4,"provider_id":1,"name":{"en":"مكة عمرة وزيارة المدينة المنورة","ar":"مكة عمرة وزيارة المدينة المنورة","ur":"مكة عمرة وزيارة المدينة المنورة"},"description":"","image":"1671883029_278-الكعبة.jpg","destinations":["1","5","6"],"trips":["10","13","14"],"destinations_move_dates":["2022-12-28","2022-12-29","2022-12-30"],"destinations_move_times":["14:00","21:00","14:00"],"fees":150,"starting_city_id":4,"date_from":"2022-12-28","date_to":"2022-12-28","time_from":"14:00","provider_notes":"","provider_archive":false,"auto_approve":true,"additional":[],"rate":0,"created_at":"2022-12-24T11:57:09.000000Z","updated_at":"2022-12-24T11:57:09.000000Z"},{"id":5,"provider_id":1,"name":{"en":"Makkah","ar":"مكة","ur":"مکہ"},"description":"","image":"1671978513_278-الكعبة.jpg","destinations":["1","2"],"trips":["9","12"],"destinations_move_dates":["2022-12-26",""],"destinations_move_times":["14:00","09:00"],"fees":150,"starting_city_id":4,"date_from":"2022-12-26","date_to":"2022-12-26","time_from":"14:00","provider_notes":"","provider_archive":false,"auto_approve":true,"additional":[],"rate":0,"created_at":"2022-12-25T14:28:33.000000Z","updated_at":"2022-12-25T14:29:17.000000Z"},{"id":6,"provider_id":1,"name":{"en":"Makkah","ar":"مكة","ur":"مکہ"},"description":"","image":"1671978720_278-الكعبة.jpg","destinations":["1","2"],"trips":["10","12"],"destinations_move_dates":["2022-12-28","2022-12-31"],"destinations_move_times":["14:00","09:00"],"fees":150,"starting_city_id":4,"date_from":"2022-12-28","date_to":"2022-12-28","time_from":"14:00","provider_notes":"","provider_archive":false,"auto_approve":true,"additional":[],"rate":0,"created_at":"2022-12-25T14:30:38.000000Z","updated_at":"2022-12-25T14:32:00.000000Z"},{"id":7,"provider_id":1,"name":{"en":"Makkah","ar":"مكة","ur":"مکہ"},"description":"","image":"1671978797_278-الكعبة.jpg","destinations":["1","2"],"trips":["11","12"],"destinations_move_dates":["2022-12-29","2022-12-31"],"destinations_move_times":["14:00","09:00"],"fees":150,"starting_city_id":4,"date_from":"2022-12-29","date_to":"2022-12-29","time_from":"14:00","provider_notes":"","provider_archive":false,"auto_approve":true,"additional":[],"rate":0,"created_at":"2022-12-25T14:33:17.000000Z","updated_at":"2022-12-25T14:33:17.000000Z"},{"id":8,"provider_id":1,"name":{"en":"Makkah 01/30 Monday","ar":"مكة 01/30 الاثنين","ur":"مکہ 01/30پیر"},"description":"","image":"1674988757_278-الكعبة.jpg","destinations":["1","2"],"trips":["51","55"],"destinations_move_dates":["2023-01-30",""],"destinations_move_times":["14:00","08:30"],"fees":150,"starting_city_id":4,"date_from":"2023-01-30","date_to":"2023-01-31","time_from":"14:00","provider_notes":"","provider_archive":false,"auto_approve":true,"additional":[],"rate":0,"created_at":"2023-01-29T10:39:17.000000Z","updated_at":"2023-01-29T11:34:43.000000Z"}],"image_base":"https://qbus-sa.com/public/images/packages"}

class PackagesResponse {
  PackagesResponse({
    String? message,
    num? code,
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

/// packages : [{"id":1,"provider_id":1,"name":{"en":"مكة مدينة","ar":"مكة مدينة","ur":"مكة مدينة"},"description":"","image":"1671479582_كعبة.jpg","destinations":["1","5","6"],"trips":["61","61","61"],"destinations_move_dates":["2023-12-19","2022-01-22",""],"destinations_move_times":["14:00","21:00","13:30"],"fees":150,"starting_city_id":4,"date_from":"2023-12-19","date_to":"2022-12-23","time_from":"14:00","provider_notes":"","provider_archive":false,"auto_approve":true,"additional":[{"id":"1","fees":"2"}],"rate":0,"created_at":"2022-12-19T19:53:02.000000Z","updated_at":"2023-02-08T12:35:47.000000Z"},{"id":2,"provider_id":1,"name":{"en":"مكة مدينة","ar":"مكة مدينة","ur":"مكة مدينة"},"description":"","image":"1671655050_كعبة.jpg","destinations":["1","5","6"],"trips":["8","5","6"],"destinations_move_dates":["2022-12-22","2022-12-22","2022-12-23"],"destinations_move_times":["14:00","21:00","13:30"],"fees":150,"starting_city_id":4,"date_from":"2022-12-21","date_to":"2022-12-23","time_from":"14:00","provider_notes":"","provider_archive":false,"auto_approve":true,"additional":[],"rate":0,"created_at":"2022-12-21T20:37:30.000000Z","updated_at":"2022-12-21T20:37:30.000000Z"},{"id":3,"provider_id":1,"name":{"en":"مكة عمرة  وزيارة المدينة المنورة","ar":"مكة عمرة وزيارة المدينة المنورة","ur":"مكة عمرة وزيارة المدينة المنورة"},"description":"","image":"1671882946_278-الكعبة.jpg","destinations":["1","5","6"],"trips":["9","13","14"],"destinations_move_dates":["2022-12-26","2022-12-29","2022-12-30"],"destinations_move_times":["14:00","21:00","14:00"],"fees":150,"starting_city_id":4,"date_from":"2022-12-26","date_to":"2022-12-26","time_from":"14:00","provider_notes":"","provider_archive":false,"auto_approve":true,"additional":[],"rate":0,"created_at":"2022-12-24T11:55:46.000000Z","updated_at":"2022-12-24T11:55:46.000000Z"},{"id":4,"provider_id":1,"name":{"en":"مكة عمرة وزيارة المدينة المنورة","ar":"مكة عمرة وزيارة المدينة المنورة","ur":"مكة عمرة وزيارة المدينة المنورة"},"description":"","image":"1671883029_278-الكعبة.jpg","destinations":["1","5","6"],"trips":["10","13","14"],"destinations_move_dates":["2022-12-28","2022-12-29","2022-12-30"],"destinations_move_times":["14:00","21:00","14:00"],"fees":150,"starting_city_id":4,"date_from":"2022-12-28","date_to":"2022-12-28","time_from":"14:00","provider_notes":"","provider_archive":false,"auto_approve":true,"additional":[],"rate":0,"created_at":"2022-12-24T11:57:09.000000Z","updated_at":"2022-12-24T11:57:09.000000Z"},{"id":5,"provider_id":1,"name":{"en":"Makkah","ar":"مكة","ur":"مکہ"},"description":"","image":"1671978513_278-الكعبة.jpg","destinations":["1","2"],"trips":["9","12"],"destinations_move_dates":["2022-12-26",""],"destinations_move_times":["14:00","09:00"],"fees":150,"starting_city_id":4,"date_from":"2022-12-26","date_to":"2022-12-26","time_from":"14:00","provider_notes":"","provider_archive":false,"auto_approve":true,"additional":[],"rate":0,"created_at":"2022-12-25T14:28:33.000000Z","updated_at":"2022-12-25T14:29:17.000000Z"},{"id":6,"provider_id":1,"name":{"en":"Makkah","ar":"مكة","ur":"مکہ"},"description":"","image":"1671978720_278-الكعبة.jpg","destinations":["1","2"],"trips":["10","12"],"destinations_move_dates":["2022-12-28","2022-12-31"],"destinations_move_times":["14:00","09:00"],"fees":150,"starting_city_id":4,"date_from":"2022-12-28","date_to":"2022-12-28","time_from":"14:00","provider_notes":"","provider_archive":false,"auto_approve":true,"additional":[],"rate":0,"created_at":"2022-12-25T14:30:38.000000Z","updated_at":"2022-12-25T14:32:00.000000Z"},{"id":7,"provider_id":1,"name":{"en":"Makkah","ar":"مكة","ur":"مکہ"},"description":"","image":"1671978797_278-الكعبة.jpg","destinations":["1","2"],"trips":["11","12"],"destinations_move_dates":["2022-12-29","2022-12-31"],"destinations_move_times":["14:00","09:00"],"fees":150,"starting_city_id":4,"date_from":"2022-12-29","date_to":"2022-12-29","time_from":"14:00","provider_notes":"","provider_archive":false,"auto_approve":true,"additional":[],"rate":0,"created_at":"2022-12-25T14:33:17.000000Z","updated_at":"2022-12-25T14:33:17.000000Z"},{"id":8,"provider_id":1,"name":{"en":"Makkah 01/30 Monday","ar":"مكة 01/30 الاثنين","ur":"مکہ 01/30پیر"},"description":"","image":"1674988757_278-الكعبة.jpg","destinations":["1","2"],"trips":["51","55"],"destinations_move_dates":["2023-01-30",""],"destinations_move_times":["14:00","08:30"],"fees":150,"starting_city_id":4,"date_from":"2023-01-30","date_to":"2023-01-31","time_from":"14:00","provider_notes":"","provider_archive":false,"auto_approve":true,"additional":[],"rate":0,"created_at":"2023-01-29T10:39:17.000000Z","updated_at":"2023-01-29T11:34:43.000000Z"}]
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
/// provider_id : 1
/// name : {"en":"مكة مدينة","ar":"مكة مدينة","ur":"مكة مدينة"}
/// description : ""
/// image : "1671479582_كعبة.jpg"
/// destinations : ["1","5","6"]
/// trips : ["61","61","61"]
/// destinations_move_dates : ["2023-12-19","2022-01-22",""]
/// destinations_move_times : ["14:00","21:00","13:30"]
/// fees : 150
/// starting_city_id : 4
/// date_from : "2023-12-19"
/// date_to : "2022-12-23"
/// time_from : "14:00"
/// provider_notes : ""
/// provider_archive : false
/// auto_approve : true
/// additional : [{"id":"1","fees":"2"}]
/// rate : 0
/// created_at : "2022-12-19T19:53:02.000000Z"
/// updated_at : "2023-02-08T12:35:47.000000Z"

class Packages {
  Packages({
    num? id,
    num? providerId,
    Name? name,
    String? description,
    String? image,
    List<String>? destinations,
    List<String>? trips,
    List<String>? destinationsMoveDates,
    List<String>? destinationsMoveTimes,
    num? fees,
    num? startingCityId,
    String? dateFrom,
    String? dateTo,
    String? timeFrom,
    String? providerNotes,
    bool? providerArchive,
    bool? autoApprove,
    List<Additional>? additional,
    num? rate,
    String? createdAt,
    String? updatedAt,
  }) {
    _id = id;
    _providerId = providerId;
    _name = name;
    _description = description;
    _image = image;
    _destinations = destinations;
    _trips = trips;
    _destinationsMoveDates = destinationsMoveDates;
    _destinationsMoveTimes = destinationsMoveTimes;
    _fees = fees;
    _startingCityId = startingCityId;
    _dateFrom = dateFrom;
    _dateTo = dateTo;
    _timeFrom = timeFrom;
    _providerNotes = providerNotes;
    _providerArchive = providerArchive;
    _autoApprove = autoApprove;
    _additional = additional;
    _rate = rate;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  Packages.fromJson(dynamic json) {
    _id = json['id'];
    _providerId = json['provider_id'];
    _name = json['name'] != null ? Name.fromJson(json['name']) : null;
    _description = json['description'];
    _image = json['image'];
    _destinations =
        json['destinations'] != null ? json['destinations'].cast<String>() : [];
    _trips = json['trips'] != null ? json['trips'].cast<String>() : [];
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
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }

  num? _id;
  num? _providerId;
  Name? _name;
  String? _description;
  String? _image;
  List<String>? _destinations;
  List<String>? _trips;
  List<String>? _destinationsMoveDates;
  List<String>? _destinationsMoveTimes;
  num? _fees;
  num? _startingCityId;
  String? _dateFrom;
  String? _dateTo;
  String? _timeFrom;
  String? _providerNotes;
  bool? _providerArchive;
  bool? _autoApprove;
  List<Additional>? _additional;
  num? _rate;
  String? _createdAt;
  String? _updatedAt;

  num? get id => _id;

  num? get providerId => _providerId;

  Name? get name => _name;

  String? get description => _description;

  String? get image => _image;

  List<String>? get destinations => _destinations;

  List<String>? get trips => _trips;

  List<String>? get destinationsMoveDates => _destinationsMoveDates;

  List<String>? get destinationsMoveTimes => _destinationsMoveTimes;

  num? get fees => _fees;

  num? get startingCityId => _startingCityId;

  String? get dateFrom => _dateFrom;

  String? get dateTo => _dateTo;

  String? get timeFrom => _timeFrom;

  String? get providerNotes => _providerNotes;

  bool? get providerArchive => _providerArchive;

  bool? get autoApprove => _autoApprove;

  List<Additional>? get additional => _additional;

  num? get rate => _rate;

  String? get createdAt => _createdAt;

  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['provider_id'] = _providerId;
    if (_name != null) {
      map['name'] = _name?.toJson();
    }
    map['description'] = _description;
    map['image'] = _image;
    map['destinations'] = _destinations;
    map['trips'] = _trips;
    map['destinations_move_dates'] = _destinationsMoveDates;
    map['destinations_move_times'] = _destinationsMoveTimes;
    map['fees'] = _fees;
    map['starting_city_id'] = _startingCityId;
    map['date_from'] = _dateFrom;
    map['date_to'] = _dateTo;
    map['time_from'] = _timeFrom;
    map['provider_notes'] = _providerNotes;
    map['provider_archive'] = _providerArchive;
    map['auto_approve'] = _autoApprove;
    if (_additional != null) {
      map['additional'] = _additional?.map((v) => v.toJson()).toList();
    }
    map['rate'] = _rate;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }
}

/// id : "1"
/// fees : "2"

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

/// en : "مكة مدينة"
/// ar : "مكة مدينة"
/// ur : "مكة مدينة"

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
