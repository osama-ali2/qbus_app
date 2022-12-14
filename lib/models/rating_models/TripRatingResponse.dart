/// code : 1
/// message : "Review saved successfully."
/// data : {"message":"Review saved successfully."}

class TripRatingResponse {
  TripRatingResponse({
    int? code,
    String? message,
    Data? data,
  }) {
    _code = code;
    _message = message;
    _data = data;
  }

  TripRatingResponse.fromJson(dynamic json) {
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

/// message : "Review saved successfully."

class Data {
  Data({
    String? message,
  }) {
    _message = message;
  }

  Data.fromJson(dynamic json) {
    _message = json['message'];
  }

  String? _message;

  String? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    return map;
  }
}
