/// message : "success"
/// code : 1
/// data : [{"id":9,"provider_id":1,"name":{"ar":"حزمة 1","en":"Package 1"},"description":{"ar":"هنالك العديد من الأنواع المتوفرة لنصوص لوريم إيبسوم، ولكن الغالبية تم تعديلها بشكل ما عبر إدخال بعض النوادر أو الكلمات العشوائية إلى النص. إن كنت تريد أن تستخدم نص لوريم إيبسوم ما، عليك أن تتحقق أولاً أن ليس هناك أي كلمات أو عبارات محرجة أو غير لائقة مخبأة في هذا النص.","en":"There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable"},"image":"1651008957_ca9ffc0170ff5ef6.png","destinations":["1"],"fees":50,"starting_city_id":2,"date_from":"2022-05-07","time_from":"10:00","provider_notes":"","provider_archive":false,"auto_approve":false,"additional":[{"id":"2","fees":"20"},{"id":"3","fees":"10"}],"rate":0,"created_at":"2022-04-26T11:26:52.000000Z","updated_at":"2022-04-26T19:04:50.000000Z"}]

class PackagesResponse {
  PackagesResponse({
    String? message,
    int? code,
    List<Data>? data,
  }) {
    _message = message;
    _code = code;
    _data = data;
  }

  PackagesResponse.fromJson(dynamic json) {
    _message = json['message'];
    _code = json['code'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
  }

  String? _message;
  int? _code;
  List<Data>? _data;

  String? get message => _message;

  int? get code => _code;

  List<Data>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    map['code'] = _code;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// id : 9
/// provider_id : 1
/// name : {"ar":"حزمة 1","en":"Package 1"}
/// description : {"ar":"هنالك العديد من الأنواع المتوفرة لنصوص لوريم إيبسوم، ولكن الغالبية تم تعديلها بشكل ما عبر إدخال بعض النوادر أو الكلمات العشوائية إلى النص. إن كنت تريد أن تستخدم نص لوريم إيبسوم ما، عليك أن تتحقق أولاً أن ليس هناك أي كلمات أو عبارات محرجة أو غير لائقة مخبأة في هذا النص.","en":"There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable"}
/// image : "1651008957_ca9ffc0170ff5ef6.png"
/// destinations : ["1"]
/// fees : 50
/// starting_city_id : 2
/// date_from : "2022-05-07"
/// time_from : "10:00"
/// provider_notes : ""
/// provider_archive : false
/// auto_approve : false
/// additional : [{"id":"2","fees":"20"},{"id":"3","fees":"10"}]
/// rate : 0
/// created_at : "2022-04-26T11:26:52.000000Z"
/// updated_at : "2022-04-26T19:04:50.000000Z"

class Data {
  Data({
    int? id,
    int? providerId,
    Name? name,
    Description? description,
    String? image,
    List<String>? destinations,
    int? fees,
    int? startingCityId,
    String? dateFrom,
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
    _fees = fees;
    _startingCityId = startingCityId;
    _dateFrom = dateFrom;
    _timeFrom = timeFrom;
    _providerNotes = providerNotes;
    _providerArchive = providerArchive;
    _autoApprove = autoApprove;
    _additional = additional;
    _rate = rate;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _providerId = json['provider_id'];
    _name = json['name'] != null ? Name.fromJson(json['name']) : null;
    _description = json['description'] != null
        ? Description.fromJson(json['description'])
        : null;
    _image = json['image'];
    _destinations =
        json['destinations'] != null ? json['destinations'].cast<String>() : [];
    _fees = json['fees'];
    _startingCityId = json['starting_city_id'];
    _dateFrom = json['date_from'];
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
  int? _fees;
  int? _startingCityId;
  String? _dateFrom;
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

  int? get fees => _fees;

  int? get startingCityId => _startingCityId;

  String? get dateFrom => _dateFrom;

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
    map['fees'] = _fees;
    map['starting_city_id'] = _startingCityId;
    map['date_from'] = _dateFrom;
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

/// id : "2"
/// fees : "20"

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

/// ar : "هنالك العديد من الأنواع المتوفرة لنصوص لوريم إيبسوم، ولكن الغالبية تم تعديلها بشكل ما عبر إدخال بعض النوادر أو الكلمات العشوائية إلى النص. إن كنت تريد أن تستخدم نص لوريم إيبسوم ما، عليك أن تتحقق أولاً أن ليس هناك أي كلمات أو عبارات محرجة أو غير لائقة مخبأة في هذا النص."
/// en : "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable"

class Description {
  Description({
    String? ar,
    String? en,
  }) {
    _ar = ar;
    _en = en;
  }

  Description.fromJson(dynamic json) {
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

/// ar : "حزمة 1"
/// en : "Package 1"

class Name {
  Name({
    String? ar,
    String? en,
  }) {
    _ar = ar;
    _en = en;
  }

  Name.fromJson(dynamic json) {
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
