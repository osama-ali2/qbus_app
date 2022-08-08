/// code : 1
/// message : "TripOrders retrieved successfully."
/// data : [{"id":1,"provider_name":"Provider1","status":"approved","fees":50,"review":"5","is_user_allow_review":false,"time_from":"10:00","time_to":"17:00","start_station_name":{"ur":"Abha","ar":"ابها","en":"Abha"},"arrival_station_name":{"ur":"Jeddah","ar":"جدة","en":"Jeddah"}},{"id":2,"provider_name":"Provider1","status":"approved","fees":50,"review":"5","is_user_allow_review":false,"time_from":"10:00","time_to":"17:00","start_station_name":{"ur":"Abha","ar":"ابها","en":"Abha"},"arrival_station_name":{"ur":"Jeddah","ar":"جدة","en":"Jeddah"}},{"id":3,"provider_name":"Provider1","status":"approved","fees":29,"review":"0","is_user_allow_review":true,"time_from":"07:00","time_to":"09:00","start_station_name":{"ur":"Abha","ar":"ابها","en":"Abha"},"arrival_station_name":{"ur":"Jeddah","ar":"جدة","en":"Jeddah"}},{"id":4,"provider_name":"Provider1","status":"approved","fees":29,"review":"0","is_user_allow_review":true,"time_from":"07:00","time_to":"09:00","start_station_name":{"ur":"Abha","ar":"ابها","en":"Abha"},"arrival_station_name":{"ur":"Jeddah","ar":"جدة","en":"Jeddah"}},{"id":5,"provider_name":"Provider1","status":"approved","fees":50,"review":"5","is_user_allow_review":false,"time_from":"10:00","time_to":"17:00","start_station_name":{"ur":"Abha","ar":"ابها","en":"Abha"},"arrival_station_name":{"ur":"Jeddah","ar":"جدة","en":"Jeddah"}},{"id":6,"provider_name":"Provider1","status":"approved","fees":29,"review":"0","is_user_allow_review":true,"time_from":"07:00","time_to":"09:00","start_station_name":{"ur":"Abha","ar":"ابها","en":"Abha"},"arrival_station_name":{"ur":"Jeddah","ar":"جدة","en":"Jeddah"}}]

class TripHistoryResponse {
  TripHistoryResponse({
      int? code, 
      String? message, 
      List<Data>? data,}){
    _code = code;
    _message = message;
    _data = data;
}

  TripHistoryResponse.fromJson(dynamic json) {
    _code = json['code'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
  }
  int? _code;
  String? _message;
  List<Data>? _data;

  int? get code => _code;
  String? get message => _message;
  List<Data>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = _code;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 1
/// provider_name : "Provider1"
/// status : "approved"
/// fees : 50
/// review : "5"
/// is_user_allow_review : false
/// time_from : "10:00"
/// time_to : "17:00"
/// start_station_name : {"ur":"Abha","ar":"ابها","en":"Abha"}
/// arrival_station_name : {"ur":"Jeddah","ar":"جدة","en":"Jeddah"}

class Data {
  Data({
      int? id, 
      String? providerName, 
      String? status, 
      int? fees, 
      String? review, 
      bool? isUserAllowReview, 
      String? timeFrom, 
      String? timeTo, 
      StartStationName? startStationName, 
      ArrivalStationName? arrivalStationName,}){
    _id = id;
    _providerName = providerName;
    _status = status;
    _fees = fees;
    _review = review;
    _isUserAllowReview = isUserAllowReview;
    _timeFrom = timeFrom;
    _timeTo = timeTo;
    _startStationName = startStationName;
    _arrivalStationName = arrivalStationName;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _providerName = json['provider_name'];
    _status = json['status'];
    _fees = json['fees'];
    _review = json['review'];
    _isUserAllowReview = json['is_user_allow_review'];
    _timeFrom = json['time_from'];
    _timeTo = json['time_to'];
    _startStationName = json['start_station_name'] != null ? StartStationName.fromJson(json['start_station_name']) : null;
    _arrivalStationName = json['arrival_station_name'] != null ? ArrivalStationName.fromJson(json['arrival_station_name']) : null;
  }
  int? _id;
  String? _providerName;
  String? _status;
  int? _fees;
  String? _review;
  bool? _isUserAllowReview;
  String? _timeFrom;
  String? _timeTo;
  StartStationName? _startStationName;
  ArrivalStationName? _arrivalStationName;

  int? get id => _id;
  String? get providerName => _providerName;
  String? get status => _status;
  int? get fees => _fees;
  String? get review => _review;
  bool? get isUserAllowReview => _isUserAllowReview;
  String? get timeFrom => _timeFrom;
  String? get timeTo => _timeTo;
  StartStationName? get startStationName => _startStationName;
  ArrivalStationName? get arrivalStationName => _arrivalStationName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['provider_name'] = _providerName;
    map['status'] = _status;
    map['fees'] = _fees;
    map['review'] = _review;
    map['is_user_allow_review'] = _isUserAllowReview;
    map['time_from'] = _timeFrom;
    map['time_to'] = _timeTo;
    if (_startStationName != null) {
      map['start_station_name'] = _startStationName?.toJson();
    }
    if (_arrivalStationName != null) {
      map['arrival_station_name'] = _arrivalStationName?.toJson();
    }
    return map;
  }

}

/// ur : "Jeddah"
/// ar : "جدة"
/// en : "Jeddah"

class ArrivalStationName {
  ArrivalStationName({
      String? ur, 
      String? ar, 
      String? en,}){
    _ur = ur;
    _ar = ar;
    _en = en;
}

  ArrivalStationName.fromJson(dynamic json) {
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

/// ur : "Abha"
/// ar : "ابها"
/// en : "Abha"

class StartStationName {
  StartStationName({
      String? ur, 
      String? ar, 
      String? en,}){
    _ur = ur;
    _ar = ar;
    _en = en;
}

  StartStationName.fromJson(dynamic json) {
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