/// message : "Please ReCheck the Given Data"
/// code : 0
/// data : {"validate_errors":[{"name":"The name field is required."},{"phone":"The phone field is required."},{"email":"The email must be a valid email address."},{"address":"The address field is required."},{"date_of_birth":"The date of birth field is required."},{"marital_status":"The marital status field is required."},{"password":"The password field is required."},{"code":"The selected code is invalid."}]}

class ValidatingErrorResponse {
  ValidatingErrorResponse({
    String? message,
    num? code,
    Data? data,
  }) {
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
  num? _code;
  Data? _data;

  String? get message => _message;

  num? get code => _code;

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

/// validate_errors : [{"name":"The name field is required."},{"phone":"The phone field is required."},{"email":"The email must be a valid email address."},{"address":"The address field is required."},{"date_of_birth":"The date of birth field is required."},{"marital_status":"The marital status field is required."},{"password":"The password field is required."},{"code":"The selected code is invalid."}]

class Data {
  Data({
    List<ValidateErrors>? validateErrors,
  }) {
    _validateErrors = validateErrors;
  }

  Data.fromJson(dynamic json) {
    if (json['validate_errors'] != null) {
      _validateErrors = [];
      json['validate_errors'].forEach((v) {
        _validateErrors?.add(ValidateErrors.fromJson(v));
      });
    }
  }

  List<ValidateErrors>? _validateErrors;

  List<ValidateErrors>? get validateErrors => _validateErrors;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_validateErrors != null) {
      map['validate_errors'] = _validateErrors?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// name : "The name field is required."

class ValidateErrors {
  ValidateErrors({
    String? name,
  }) {
    _name = name;
  }

  ValidateErrors.fromJson(dynamic json) {
    _name = json['name'];
  }

  String? _name;

  String? get name => _name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    return map;
  }
}
