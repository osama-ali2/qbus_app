/// code : 1
/// message : "TripOrders retrieved successfully."
/// data : [{"id":1,"package_id":1,"name":{"ur":"Tourist program to Saudi Arabia for 5 days","ar":"برنامج سياحي إلى السعودية لمدة 5 أيام","en":"Tourist program to Saudi Arabia for 5 days"},"provider_name":"Provider1","status":"approved","fees":3000,"review":"3","is_user_allow_review":false,"starting_city_name":{"ur":"Abha","ar":"ابها","en":"Abha"},"starting_date":"2022-07-20","starting_time":"10:00"},{"id":2,"package_id":2,"name":{"ur":"A tourist trip in Abha Al-Bahiya","ar":"رحلة سياحية في أبها البهية","en":"A tourist trip in Abha Al-Bahiya"},"provider_name":"Provider1","status":"approved","fees":10000,"review":"0","is_user_allow_review":true,"starting_city_name":{"ur":"Abha","ar":"ابها","en":"Abha"},"starting_date":"2022-07-30","starting_time":"08:00"},{"id":3,"package_id":3,"name":{"ur":"Summer tour in Tabuk - for 3 days","ar":"جولة سياحية صيفية في تبوك - لمدة 3 أيام","en":"Summer tour in Tabuk - for 3 days"},"provider_name":"Provider1","status":"pending","fees":750,"review":"0","is_user_allow_review":true,"starting_city_name":{"ur":"Riyadh","ar":"الرياض","en":"Riyadh"},"starting_date":"2022-07-30","starting_time":"08:00"},{"id":4,"package_id":4,"name":{"ur":"Dream Island - for 3 days","ar":"جزيرة الأحلام - لمدة 3 أيام","en":"Dream Island - for 3 days"},"provider_name":"Provider1","status":"approved","fees":14000,"review":"0","is_user_allow_review":true,"starting_city_name":{"ur":"Abha","ar":"ابها","en":"Abha"},"starting_date":"2022-07-31","starting_time":"10:00"}]

class PackageHistoryResponse {
  PackageHistoryResponse({
    int? code,
    String? message,
    List<Data>? data,}){
    _code = code;
    _message = message;
    _data = data;
  }

  PackageHistoryResponse.fromJson(dynamic json) {
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
/// package_id : 1
/// name : {"ur":"Tourist program to Saudi Arabia for 5 days","ar":"برنامج سياحي إلى السعودية لمدة 5 أيام","en":"Tourist program to Saudi Arabia for 5 days"}
/// provider_name : "Provider1"
/// status : "approved"
/// fees : 3000
/// review : "3"
/// is_user_allow_review : false
/// starting_city_name : {"ur":"Abha","ar":"ابها","en":"Abha"}
/// starting_date : "2022-07-20"
/// starting_time : "10:00"

class Data {
  Data({
    int? id,
    int? packageId,
    Name? name,
    String? providerName,
    String? status,
    int? fees,
    String? review,
    bool? isUserAllowReview,
    StartingCityName? startingCityName,
    String? startingDate,
    String? startingTime,}){
    _id = id;
    _packageId = packageId;
    _name = name;
    _providerName = providerName;
    _status = status;
    _fees = fees;
    _review = review;
    _isUserAllowReview = isUserAllowReview;
    _startingCityName = startingCityName;
    _startingDate = startingDate;
    _startingTime = startingTime;
  }

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _packageId = json['package_id'];
    _name = json['name'] != null ? Name.fromJson(json['name']) : null;
    _providerName = json['provider_name'];
    _status = json['status'];
    _fees = json['fees'];
    _review = json['review'];
    _isUserAllowReview = json['is_user_allow_review'];
    _startingCityName = json['starting_city_name'] != null ? StartingCityName.fromJson(json['starting_city_name']) : null;
    _startingDate = json['starting_date'];
    _startingTime = json['starting_time'];
  }
  int? _id;
  int? _packageId;
  Name? _name;
  String? _providerName;
  String? _status;
  int? _fees;
  String? _review;
  bool? _isUserAllowReview;
  StartingCityName? _startingCityName;
  String? _startingDate;
  String? _startingTime;

  int? get id => _id;
  int? get packageId => _packageId;
  Name? get name => _name;
  String? get providerName => _providerName;
  String? get status => _status;
  int? get fees => _fees;
  String? get review => _review;
  bool? get isUserAllowReview => _isUserAllowReview;
  StartingCityName? get startingCityName => _startingCityName;
  String? get startingDate => _startingDate;
  String? get startingTime => _startingTime;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['package_id'] = _packageId;
    if (_name != null) {
      map['name'] = _name?.toJson();
    }
    map['provider_name'] = _providerName;
    map['status'] = _status;
    map['fees'] = _fees;
    map['review'] = _review;
    map['is_user_allow_review'] = _isUserAllowReview;
    if (_startingCityName != null) {
      map['starting_city_name'] = _startingCityName?.toJson();
    }
    map['starting_date'] = _startingDate;
    map['starting_time'] = _startingTime;
    return map;
  }

}

/// ur : "Abha"
/// ar : "ابها"
/// en : "Abha"

class StartingCityName {
  StartingCityName({
    String? ur,
    String? ar,
    String? en,}){
    _ur = ur;
    _ar = ar;
    _en = en;
  }

  StartingCityName.fromJson(dynamic json) {
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

/// ur : "Tourist program to Saudi Arabia for 5 days"
/// ar : "برنامج سياحي إلى السعودية لمدة 5 أيام"
/// en : "Tourist program to Saudi Arabia for 5 days"

class Name {
  Name({
    String? ur,
    String? ar,
    String? en,}){
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