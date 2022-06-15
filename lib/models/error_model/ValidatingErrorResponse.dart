/// message : "Please ReCheck the Fields"
/// code : 0
/// data : {"validate_errors":[{"email":"The email field is required."},{"phone":"The phone field is required."},{"subject":"The subject field is required."},{"message":"The message field is required."}],"message":"validate_errors"}

class ValidatingErrorResponse {
  ValidatingErrorResponse({
      String? message, 
      int? code, 
      Data? data,}){
    _message = message;
    _code = code;
    _data = data;
}

  ValidatingErrorResponse.fromJson(dynamic json) {
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

/// validate_errors : [{"email":"The email field is required."},{"phone":"The phone field is required."},{"subject":"The subject field is required."},{"message":"The message field is required."}]
/// message : "validate_errors"

class Data {
  Data({
      List<ValidateErrors>? validateErrors, 
      String? message,}){
    _validateErrors = validateErrors;
    _message = message;
}

  Data.fromJson(dynamic json) {
    if (json['validate_errors'] != null) {
      _validateErrors = [];
      json['validate_errors'].forEach((v) {
        _validateErrors?.add(ValidateErrors.fromJson(v));
      });
    }
    _message = json['message'];
  }
  List<ValidateErrors>? _validateErrors;
  String? _message;

  List<ValidateErrors>? get validateErrors => _validateErrors;
  String? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_validateErrors != null) {
      map['validate_errors'] = _validateErrors?.map((v) => v.toJson()).toList();
    }
    map['message'] = _message;
    return map;
  }

}

/// email : "The email field is required."

class ValidateErrors {
  ValidateErrors({
      String? email,}){
    _email = email;
}

  ValidateErrors.fromJson(dynamic json) {
    _email = json['email'];
  }
  String? _email;

  String? get email => _email;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['email'] = _email;
    return map;
  }

}