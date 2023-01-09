class OneWayOrdersTripResponse {
  OneWayOrdersTripResponse({
    int? code,
    String? message,
    Data? data,}){
    _code = code;
    _message = message;
    _data = data;
  }

  OneWayOrdersTripResponse.fromJson(dynamic json) {
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
    int? tripId,}){
    _tripId = tripId;
  }

  Data.fromJson(dynamic json) {
    _tripId = json['trip_id'];
  }
  int? _tripId;

  int? get tripId => _tripId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['trip_id'] = _tripId;
    return map;
  }

}