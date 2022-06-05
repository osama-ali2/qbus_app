/// message : "success"
/// code : 1
/// data : {"trips":[{"id":35,"name":"#35","description":{"en":""},"image":"","date_from":"2022-06-29","date_to":"2022-06-29","time_from":"16:00","time_to":"17:00","lat":"","lng":"","zoom":"","provider_id":1,"bus_id":3,"fees":19,"max":150,"provider_notes":"","provider_archive":false,"auto_approve":false,"rate":0,"destination_id":1,"additional":[{"id":"3","fees":"5"}],"created_at":"2022-05-25T05:00:13.000000Z","updated_at":"2022-05-25T05:00:13.000000Z"},{"id":38,"name":"#38","description":{"en":""},"image":"","date_from":"2022-06-29","date_to":"2022-06-29","time_from":"07:00","time_to":"09:00","lat":"","lng":"","zoom":"","provider_id":1,"bus_id":3,"fees":29,"max":150,"provider_notes":"","provider_archive":false,"auto_approve":false,"rate":0,"destination_id":1,"additional":[{"id":"1","fees":"20"},{"id":"2","fees":"50"}],"created_at":"2022-05-28T06:45:29.000000Z","updated_at":"2022-05-28T06:57:36.000000Z"}]}

class TripsResponse {
  TripsResponse({
      String? message, 
      int? code, 
      Data? data,}){
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

/// trips : [{"id":35,"name":"#35","description":{"en":""},"image":"","date_from":"2022-06-29","date_to":"2022-06-29","time_from":"16:00","time_to":"17:00","lat":"","lng":"","zoom":"","provider_id":1,"bus_id":3,"fees":19,"max":150,"provider_notes":"","provider_archive":false,"auto_approve":false,"rate":0,"destination_id":1,"additional":[{"id":"3","fees":"5"}],"created_at":"2022-05-25T05:00:13.000000Z","updated_at":"2022-05-25T05:00:13.000000Z"},{"id":38,"name":"#38","description":{"en":""},"image":"","date_from":"2022-06-29","date_to":"2022-06-29","time_from":"07:00","time_to":"09:00","lat":"","lng":"","zoom":"","provider_id":1,"bus_id":3,"fees":29,"max":150,"provider_notes":"","provider_archive":false,"auto_approve":false,"rate":0,"destination_id":1,"additional":[{"id":"1","fees":"20"},{"id":"2","fees":"50"}],"created_at":"2022-05-28T06:45:29.000000Z","updated_at":"2022-05-28T06:57:36.000000Z"}]

class Data {
  Data({
      List<Trips>? trips,}){
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

/// id : 35
/// name : "#35"
/// description : {"en":""}
/// image : ""
/// date_from : "2022-06-29"
/// date_to : "2022-06-29"
/// time_from : "16:00"
/// time_to : "17:00"
/// lat : ""
/// lng : ""
/// zoom : ""
/// provider_id : 1
/// bus_id : 3
/// fees : 19
/// max : 150
/// provider_notes : ""
/// provider_archive : false
/// auto_approve : false
/// rate : 0
/// destination_id : 1
/// additional : [{"id":"3","fees":"5"}]
/// created_at : "2022-05-25T05:00:13.000000Z"
/// updated_at : "2022-05-25T05:00:13.000000Z"

class Trips {
  Trips({
      int? id, 
      String? name, 
      Description? description, 
      String? image, 
      String? dateFrom, 
      String? dateTo, 
      String? timeFrom, 
      String? timeTo, 
      String? lat, 
      String? lng, 
      String? zoom, 
      int? providerId, 
      int? busId, 
      int? fees, 
      int? max, 
      String? providerNotes, 
      bool? providerArchive, 
      bool? autoApprove, 
      int? rate, 
      int? destinationId, 
      List<Additional>? additional, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _name = name;
    _description = description;
    _image = image;
    _dateFrom = dateFrom;
    _dateTo = dateTo;
    _timeFrom = timeFrom;
    _timeTo = timeTo;
    _lat = lat;
    _lng = lng;
    _zoom = zoom;
    _providerId = providerId;
    _busId = busId;
    _fees = fees;
    _max = max;
    _providerNotes = providerNotes;
    _providerArchive = providerArchive;
    _autoApprove = autoApprove;
    _rate = rate;
    _destinationId = destinationId;
    _additional = additional;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Trips.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _description = json['description'] != null ? Description.fromJson(json['description']) : null;
    _image = json['image'];
    _dateFrom = json['date_from'];
    _dateTo = json['date_to'];
    _timeFrom = json['time_from'];
    _timeTo = json['time_to'];
    _lat = json['lat'];
    _lng = json['lng'];
    _zoom = json['zoom'];
    _providerId = json['provider_id'];
    _busId = json['bus_id'];
    _fees = json['fees'];
    _max = json['max'];
    _providerNotes = json['provider_notes'];
    _providerArchive = json['provider_archive'];
    _autoApprove = json['auto_approve'];
    _rate = json['rate'];
    _destinationId = json['destination_id'];
    if (json['additional'] != null) {
      _additional = [];
      json['additional'].forEach((v) {
        _additional?.add(Additional.fromJson(v));
      });
    }
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  int? _id;
  String? _name;
  Description? _description;
  String? _image;
  String? _dateFrom;
  String? _dateTo;
  String? _timeFrom;
  String? _timeTo;
  String? _lat;
  String? _lng;
  String? _zoom;
  int? _providerId;
  int? _busId;
  int? _fees;
  int? _max;
  String? _providerNotes;
  bool? _providerArchive;
  bool? _autoApprove;
  int? _rate;
  int? _destinationId;
  List<Additional>? _additional;
  String? _createdAt;
  String? _updatedAt;

  int? get id => _id;
  String? get name => _name;
  Description? get description => _description;
  String? get image => _image;
  String? get dateFrom => _dateFrom;
  String? get dateTo => _dateTo;
  String? get timeFrom => _timeFrom;
  String? get timeTo => _timeTo;
  String? get lat => _lat;
  String? get lng => _lng;
  String? get zoom => _zoom;
  int? get providerId => _providerId;
  int? get busId => _busId;
  int? get fees => _fees;
  int? get max => _max;
  String? get providerNotes => _providerNotes;
  bool? get providerArchive => _providerArchive;
  bool? get autoApprove => _autoApprove;
  int? get rate => _rate;
  int? get destinationId => _destinationId;
  List<Additional>? get additional => _additional;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    if (_description != null) {
      map['description'] = _description?.toJson();
    }
    map['image'] = _image;
    map['date_from'] = _dateFrom;
    map['date_to'] = _dateTo;
    map['time_from'] = _timeFrom;
    map['time_to'] = _timeTo;
    map['lat'] = _lat;
    map['lng'] = _lng;
    map['zoom'] = _zoom;
    map['provider_id'] = _providerId;
    map['bus_id'] = _busId;
    map['fees'] = _fees;
    map['max'] = _max;
    map['provider_notes'] = _providerNotes;
    map['provider_archive'] = _providerArchive;
    map['auto_approve'] = _autoApprove;
    map['rate'] = _rate;
    map['destination_id'] = _destinationId;
    if (_additional != null) {
      map['additional'] = _additional?.map((v) => v.toJson()).toList();
    }
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}

/// id : "3"
/// fees : "5"

class Additional {
  Additional({
      String? id, 
      String? fees,}){
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

/// en : ""

class Description {
  Description({
      String? en,}){
    _en = en;
}

  Description.fromJson(dynamic json) {
    _en = json['en'];
  }
  String? _en;

  String? get en => _en;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['en'] = _en;
    return map;
  }

}