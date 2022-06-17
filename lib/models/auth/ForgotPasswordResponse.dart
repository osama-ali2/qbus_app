/// message : "Reset Password Otp has been sent to +96605080**** you can use 8581"
/// code : 1
/// data : {"message":"Reset Password Otp has been sent to +96605080**** you can use 8581"}

class ForgotPasswordResponse {
  ForgotPasswordResponse({
      String? message, 
      int? code, 
      Data? data,}){
    _message = message;
    _code = code;
    _data = data;
}

  ForgotPasswordResponse.fromJson(dynamic json) {
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

/// message : "Reset Password Otp has been sent to +96605080**** you can use 8581"

class Data {
  Data({
      String? message,}){
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