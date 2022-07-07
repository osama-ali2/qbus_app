/// message : "messages.success"
/// code : 1
/// data : {"packages":{"id":1,"provider_id":1,"name":{"ur":"Tourist program to Saudi Arabia for 5 days","ar":"برنامج سياحي إلى السعودية لمدة 5 أيام","en":"Tourist program to Saudi Arabia for 5 days"},"date_from":"2022-07-20","time_from":"10:00","description":{"ur":"If you are thinking of visiting the Kingdom of Saudi Arabia to spend your vacation with the family, you can choose one of the tourism programs that we have organized for you in Saudi Arabia to suit your vacation days and which will enable you to spend enjoyable times in the Kingdom.\r\nWe offer you, lovers of tourist trips, a tourist program to Saudi Arabia for 5 days, where you will spend them in the most beautiful cities and tourist places in them.","ar":"إذا كنت تفكر بزيارة المملكة العربية السعودية لقضاء أجازتك مع العائلة يمكنكم اختيار أحد البرامج السياحية التي نظمناها لكم في السعودية لتناسب أيام عطلتكم والتي تمكنكم من قضاء أوقات ممتعة في المملكة.\r\nنقدم لكم محبي الرحلات السياحية برنامج سياحي إلى السعودية لمدة 5 أيام تقضونهم في أجمل المدن والأماكن السياحية فيها.","en":"If you are thinking of visiting the Kingdom of Saudi Arabia to spend your vacation with the family, you can choose one of the tourism programs that we have organized for you in Saudi Arabia to suit your vacation days and which will enable you to spend enjoyable times in the Kingdom.\r\nWe offer you, lovers of tourist trips, a tourist program to Saudi Arabia for 5 days, where you will spend them in the most beautiful cities and tourist places in them."},"image":"1656841362_sa.jpg","fees":3000,"start_station_name":"{\"ur\":\"Abha\",\"ar\":\"'ا'ب'ه''ا\",\"en\":\"Abha\"}","rate":0,"additionals":[{"id":2,"fees":5000,"name":{"ar":"وجبة","en":"Meal"}},{"id":3,"fees":0,"name":{"ar":"انترنت","en":"Internet"}}],"destinations":[{"id":8,"provider_id":1,"from_city_id":8,"to_city_id":12,"starting_terminal_id":1,"arrival_terminal_id":3,"stops":["2"],"created_at":"2022-07-03T09:37:47.000000Z","updated_at":"2022-07-03T09:37:47.000000Z","name":"Makka - Al Medina","from_city":{"id":8,"name":{"ur":"Makka","ar":"مكة المكرمة","en":"Makka"},"created_at":"2022-07-03T09:21:03.000000Z","updated_at":"2022-07-03T09:21:03.000000Z"},"to_city":{"id":12,"name":{"ur":"Al Medina","ar":"المدينة المنورة","en":"Al Medina"},"created_at":"2022-07-03T09:24:23.000000Z","updated_at":"2022-07-03T09:24:23.000000Z"}},{"id":9,"provider_id":1,"from_city_id":12,"to_city_id":6,"starting_terminal_id":1,"arrival_terminal_id":3,"stops":["2"],"created_at":"2022-07-03T09:38:13.000000Z","updated_at":"2022-07-03T09:38:13.000000Z","name":"Al Medina - Abha","from_city":{"id":12,"name":{"ur":"Al Medina","ar":"المدينة المنورة","en":"Al Medina"},"created_at":"2022-07-03T09:24:23.000000Z","updated_at":"2022-07-03T09:24:23.000000Z"},"to_city":{"id":6,"name":{"ur":"Abha","ar":"ابها","en":"Abha"},"created_at":"2022-07-03T09:19:49.000000Z","updated_at":"2022-07-03T09:19:49.000000Z"}}]},"image_base":"https://qbus.rabaaladawia.com/public/images/packages"}

class PackageDetailResponse {
  PackageDetailResponse({
    String? message,
    int? code,
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

/// packages : {"id":1,"provider_id":1,"name":{"ur":"Tourist program to Saudi Arabia for 5 days","ar":"برنامج سياحي إلى السعودية لمدة 5 أيام","en":"Tourist program to Saudi Arabia for 5 days"},"date_from":"2022-07-20","time_from":"10:00","description":{"ur":"If you are thinking of visiting the Kingdom of Saudi Arabia to spend your vacation with the family, you can choose one of the tourism programs that we have organized for you in Saudi Arabia to suit your vacation days and which will enable you to spend enjoyable times in the Kingdom.\r\nWe offer you, lovers of tourist trips, a tourist program to Saudi Arabia for 5 days, where you will spend them in the most beautiful cities and tourist places in them.","ar":"إذا كنت تفكر بزيارة المملكة العربية السعودية لقضاء أجازتك مع العائلة يمكنكم اختيار أحد البرامج السياحية التي نظمناها لكم في السعودية لتناسب أيام عطلتكم والتي تمكنكم من قضاء أوقات ممتعة في المملكة.\r\nنقدم لكم محبي الرحلات السياحية برنامج سياحي إلى السعودية لمدة 5 أيام تقضونهم في أجمل المدن والأماكن السياحية فيها.","en":"If you are thinking of visiting the Kingdom of Saudi Arabia to spend your vacation with the family, you can choose one of the tourism programs that we have organized for you in Saudi Arabia to suit your vacation days and which will enable you to spend enjoyable times in the Kingdom.\r\nWe offer you, lovers of tourist trips, a tourist program to Saudi Arabia for 5 days, where you will spend them in the most beautiful cities and tourist places in them."},"image":"1656841362_sa.jpg","fees":3000,"start_station_name":"{\"ur\":\"Abha\",\"ar\":\"'ا'ب'ه''ا\",\"en\":\"Abha\"}","rate":0,"additionals":[{"id":2,"fees":5000,"name":{"ar":"وجبة","en":"Meal"}},{"id":3,"fees":0,"name":{"ar":"انترنت","en":"Internet"}}],"destinations":[{"id":8,"provider_id":1,"from_city_id":8,"to_city_id":12,"starting_terminal_id":1,"arrival_terminal_id":3,"stops":["2"],"created_at":"2022-07-03T09:37:47.000000Z","updated_at":"2022-07-03T09:37:47.000000Z","name":"Makka - Al Medina","from_city":{"id":8,"name":{"ur":"Makka","ar":"مكة المكرمة","en":"Makka"},"created_at":"2022-07-03T09:21:03.000000Z","updated_at":"2022-07-03T09:21:03.000000Z"},"to_city":{"id":12,"name":{"ur":"Al Medina","ar":"المدينة المنورة","en":"Al Medina"},"created_at":"2022-07-03T09:24:23.000000Z","updated_at":"2022-07-03T09:24:23.000000Z"}},{"id":9,"provider_id":1,"from_city_id":12,"to_city_id":6,"starting_terminal_id":1,"arrival_terminal_id":3,"stops":["2"],"created_at":"2022-07-03T09:38:13.000000Z","updated_at":"2022-07-03T09:38:13.000000Z","name":"Al Medina - Abha","from_city":{"id":12,"name":{"ur":"Al Medina","ar":"المدينة المنورة","en":"Al Medina"},"created_at":"2022-07-03T09:24:23.000000Z","updated_at":"2022-07-03T09:24:23.000000Z"},"to_city":{"id":6,"name":{"ur":"Abha","ar":"ابها","en":"Abha"},"created_at":"2022-07-03T09:19:49.000000Z","updated_at":"2022-07-03T09:19:49.000000Z"}}]}
/// image_base : "https://qbus.rabaaladawia.com/public/images/packages"

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

/// id : 1
/// provider_id : 1
/// name : {"ur":"Tourist program to Saudi Arabia for 5 days","ar":"برنامج سياحي إلى السعودية لمدة 5 أيام","en":"Tourist program to Saudi Arabia for 5 days"}
/// date_from : "2022-07-20"
/// time_from : "10:00"
/// description : {"ur":"If you are thinking of visiting the Kingdom of Saudi Arabia to spend your vacation with the family, you can choose one of the tourism programs that we have organized for you in Saudi Arabia to suit your vacation days and which will enable you to spend enjoyable times in the Kingdom.\r\nWe offer you, lovers of tourist trips, a tourist program to Saudi Arabia for 5 days, where you will spend them in the most beautiful cities and tourist places in them.","ar":"إذا كنت تفكر بزيارة المملكة العربية السعودية لقضاء أجازتك مع العائلة يمكنكم اختيار أحد البرامج السياحية التي نظمناها لكم في السعودية لتناسب أيام عطلتكم والتي تمكنكم من قضاء أوقات ممتعة في المملكة.\r\nنقدم لكم محبي الرحلات السياحية برنامج سياحي إلى السعودية لمدة 5 أيام تقضونهم في أجمل المدن والأماكن السياحية فيها.","en":"If you are thinking of visiting the Kingdom of Saudi Arabia to spend your vacation with the family, you can choose one of the tourism programs that we have organized for you in Saudi Arabia to suit your vacation days and which will enable you to spend enjoyable times in the Kingdom.\r\nWe offer you, lovers of tourist trips, a tourist program to Saudi Arabia for 5 days, where you will spend them in the most beautiful cities and tourist places in them."}
/// image : "1656841362_sa.jpg"
/// fees : 3000
/// start_station_name : "{\"ur\":\"Abha\",\"ar\":\"'ا'ب'ه''ا\",\"en\":\"Abha\"}"
/// rate : 0
/// additionals : [{"id":2,"fees":5000,"name":{"ar":"وجبة","en":"Meal"}},{"id":3,"fees":0,"name":{"ar":"انترنت","en":"Internet"}}]
/// destinations : [{"id":8,"provider_id":1,"from_city_id":8,"to_city_id":12,"starting_terminal_id":1,"arrival_terminal_id":3,"stops":["2"],"created_at":"2022-07-03T09:37:47.000000Z","updated_at":"2022-07-03T09:37:47.000000Z","name":"Makka - Al Medina","from_city":{"id":8,"name":{"ur":"Makka","ar":"مكة المكرمة","en":"Makka"},"created_at":"2022-07-03T09:21:03.000000Z","updated_at":"2022-07-03T09:21:03.000000Z"},"to_city":{"id":12,"name":{"ur":"Al Medina","ar":"المدينة المنورة","en":"Al Medina"},"created_at":"2022-07-03T09:24:23.000000Z","updated_at":"2022-07-03T09:24:23.000000Z"}},{"id":9,"provider_id":1,"from_city_id":12,"to_city_id":6,"starting_terminal_id":1,"arrival_terminal_id":3,"stops":["2"],"created_at":"2022-07-03T09:38:13.000000Z","updated_at":"2022-07-03T09:38:13.000000Z","name":"Al Medina - Abha","from_city":{"id":12,"name":{"ur":"Al Medina","ar":"المدينة المنورة","en":"Al Medina"},"created_at":"2022-07-03T09:24:23.000000Z","updated_at":"2022-07-03T09:24:23.000000Z"},"to_city":{"id":6,"name":{"ur":"Abha","ar":"ابها","en":"Abha"},"created_at":"2022-07-03T09:19:49.000000Z","updated_at":"2022-07-03T09:19:49.000000Z"}}]

class Packages {
  Packages({
    int? id,
    int? providerId,
    Name? name,
    String? dateFrom,
    String? timeFrom,
    Description? description,
    String? image,
    int? fees,
    String? startStationName,
    int? rate,
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
    _description = json['description'] != null
        ? Description.fromJson(json['description'])
        : null;
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

  int? _id;
  int? _providerId;
  Name? _name;
  String? _dateFrom;
  String? _timeFrom;
  Description? _description;
  String? _image;
  int? _fees;
  String? _startStationName;
  int? _rate;
  List<Additionals>? _additionals;
  List<Destinations>? _destinations;

  int? get id => _id;

  int? get providerId => _providerId;

  Name? get name => _name;

  String? get dateFrom => _dateFrom;

  String? get timeFrom => _timeFrom;

  Description? get description => _description;

  String? get image => _image;

  int? get fees => _fees;

  String? get startStationName => _startStationName;

  int? get rate => _rate;

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
    if (_description != null) {
      map['description'] = _description?.toJson();
    }
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

/// id : 8
/// provider_id : 1
/// from_city_id : 8
/// to_city_id : 12
/// starting_terminal_id : 1
/// arrival_terminal_id : 3
/// stops : ["2"]
/// created_at : "2022-07-03T09:37:47.000000Z"
/// updated_at : "2022-07-03T09:37:47.000000Z"
/// name : "Makka - Al Medina"
/// from_city : {"id":8,"name":{"ur":"Makka","ar":"مكة المكرمة","en":"Makka"},"created_at":"2022-07-03T09:21:03.000000Z","updated_at":"2022-07-03T09:21:03.000000Z"}
/// to_city : {"id":12,"name":{"ur":"Al Medina","ar":"المدينة المنورة","en":"Al Medina"},"created_at":"2022-07-03T09:24:23.000000Z","updated_at":"2022-07-03T09:24:23.000000Z"}

class Destinations {
  Destinations({
    int? id,
    int? providerId,
    int? fromCityId,
    int? toCityId,
    int? startingTerminalId,
    int? arrivalTerminalId,
    List<String>? stops,
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
    _stops = json['stops'] != null ? json['stops'].cast<String>() : [];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _name = json['name'];
    _fromCity =
        json['from_city'] != null ? FromCity.fromJson(json['from_city']) : null;
    _toCity = json['to_city'] != null ? ToCity.fromJson(json['to_city']) : null;
  }

  int? _id;
  int? _providerId;
  int? _fromCityId;
  int? _toCityId;
  int? _startingTerminalId;
  int? _arrivalTerminalId;
  List<String>? _stops;
  String? _createdAt;
  String? _updatedAt;
  String? _name;
  FromCity? _fromCity;
  ToCity? _toCity;

  int? get id => _id;

  int? get providerId => _providerId;

  int? get fromCityId => _fromCityId;

  int? get toCityId => _toCityId;

  int? get startingTerminalId => _startingTerminalId;

  int? get arrivalTerminalId => _arrivalTerminalId;

  List<String>? get stops => _stops;

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

/// id : 12
/// name : {"ur":"Al Medina","ar":"المدينة المنورة","en":"Al Medina"}
/// created_at : "2022-07-03T09:24:23.000000Z"
/// updated_at : "2022-07-03T09:24:23.000000Z"

class ToCity {
  ToCity({
    int? id,
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

  int? _id;
  Name? _name;
  String? _createdAt;
  String? _updatedAt;

  int? get id => _id;

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

/// ur : "Al Medina"
/// ar : "المدينة المنورة"
/// en : "Al Medina"

class Name {
  Name({
    String? ur,
    String? ar,
    String? en,
  }) {
    _ur = ur;
    _ar = ar;
    _en = en;
  }

  Name.fromJson(dynamic json) {
    _ur = json['ur'];
    _ar = json['ar'];
    _en = json['en'];
  }

  String? _ur;
  String? _ar;
  String? _en;

  String? get ur => _ur;

  String? get ar => _ar;

  String? get en => _en;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['ur'] = _ur;
    map['ar'] = _ar;
    map['en'] = _en;
    return map;
  }
}

/// id : 8
/// name : {"ur":"Makka","ar":"مكة المكرمة","en":"Makka"}
/// created_at : "2022-07-03T09:21:03.000000Z"
/// updated_at : "2022-07-03T09:21:03.000000Z"

class FromCity {
  FromCity({
    int? id,
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

  int? _id;
  Name? _name;
  String? _createdAt;
  String? _updatedAt;

  int? get id => _id;

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

/// id : 2
/// fees : 5000
/// name : {"ar":"وجبة","en":"Meal"}

class Additionals {
  Additionals({
    int? id,
    int? fees,
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

  int? _id;
  int? _fees;
  Name? _name;

  int? get id => _id;

  int? get fees => _fees;

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

/// ur : "If you are thinking of visiting the Kingdom of Saudi Arabia to spend your vacation with the family, you can choose one of the tourism programs that we have organized for you in Saudi Arabia to suit your vacation days and which will enable you to spend enjoyable times in the Kingdom.\r\nWe offer you, lovers of tourist trips, a tourist program to Saudi Arabia for 5 days, where you will spend them in the most beautiful cities and tourist places in them."
/// ar : "إذا كنت تفكر بزيارة المملكة العربية السعودية لقضاء أجازتك مع العائلة يمكنكم اختيار أحد البرامج السياحية التي نظمناها لكم في السعودية لتناسب أيام عطلتكم والتي تمكنكم من قضاء أوقات ممتعة في المملكة.\r\nنقدم لكم محبي الرحلات السياحية برنامج سياحي إلى السعودية لمدة 5 أيام تقضونهم في أجمل المدن والأماكن السياحية فيها."
/// en : "If you are thinking of visiting the Kingdom of Saudi Arabia to spend your vacation with the family, you can choose one of the tourism programs that we have organized for you in Saudi Arabia to suit your vacation days and which will enable you to spend enjoyable times in the Kingdom.\r\nWe offer you, lovers of tourist trips, a tourist program to Saudi Arabia for 5 days, where you will spend them in the most beautiful cities and tourist places in them."

class Description {
  Description({
    String? ur,
    String? ar,
    String? en,
  }) {
    _ur = ur;
    _ar = ar;
    _en = en;
  }

  Description.fromJson(dynamic json) {
    _ur = json['ur'];
    _ar = json['ar'];
    _en = json['en'];
  }

  String? _ur;
  String? _ar;
  String? _en;

  String? get ur => _ur;

  String? get ar => _ar;

  String? get en => _en;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['ur'] = _ur;
    map['ar'] = _ar;
    map['en'] = _en;
    return map;
  }
}
