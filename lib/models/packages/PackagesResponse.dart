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

class Packages {
  Packages({
    int? id,
    int? providerId,
    Name? name,
    Description? description,
    String? image,
    List<String>? destinations,
    List<String>? trips,
    List<String>? destinationsMoveDates,
    List<String>? destinationsMoveTimes,
    double? fees,
    int? startingCityId,
    String? dateFrom,
    String? dateTo,
    String? timeFrom,
    String? providerNotes,
    bool? providerArchive,
    bool? autoApprove,
    List<Additional>? additional,
    int? rate,
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
    _description = json['description'] != null
        ? Description.fromJson(json['description'])
        : null;
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

  int? _id;
  int? _providerId;
  Name? _name;
  Description? _description;
  String? _image;
  List<String>? _destinations;
  List<String>? _trips;
  List<String>? _destinationsMoveDates;
  List<String>? _destinationsMoveTimes;
  double? _fees;
  int? _startingCityId;
  String? _dateFrom;
  String? _dateTo;
  String? _timeFrom;
  String? _providerNotes;
  bool? _providerArchive;
  bool? _autoApprove;
  List<Additional>? _additional;
  int? _rate;
  String? _createdAt;
  String? _updatedAt;

  int? get id => _id;

  int? get providerId => _providerId;

  Name? get name => _name;

  Description? get description => _description;

  String? get image => _image;

  List<String>? get destinations => _destinations;

  List<String>? get trips => _trips;

  List<String>? get destinationsMoveDates => _destinationsMoveDates;

  List<String>? get destinationsMoveTimes => _destinationsMoveTimes;

  double? get fees => _fees;

  int? get startingCityId => _startingCityId;

  String? get dateFrom => _dateFrom;

  String? get dateTo => _dateTo;

  String? get timeFrom => _timeFrom;

  String? get providerNotes => _providerNotes;

  bool? get providerArchive => _providerArchive;

  bool? get autoApprove => _autoApprove;

  List<Additional>? get additional => _additional;

  int? get rate => _rate;

  String? get createdAt => _createdAt;

  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['provider_id'] = _providerId;
    if (_name != null) {
      map['name'] = _name?.toJson();
    }
    if (_description != null) {
      map['description'] = _description?.toJson();
    }
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

class Description {
  Description({
    String? ur,
  }) {
    _ur = ur;
  }

  Description.fromJson(dynamic json) {
    _ur = json['ur'];
  }

  String? _ur;

  String? get ur => _ur;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['ur'] = _ur;
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
