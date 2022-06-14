/// message : "success"
/// code : 1
/// data : {"user":{"id":5,"name":"AML GINANIA","email":"ss@maill.ru","phone":"0552837665","image":"","address":"test address","date_of_birth":"1995-08-16","marital_status":"single","block":0,"block_notes":"","wallet":100,"language":""}}

class UserResponse {
  UserResponse({
    String? message,
    int? code,
    Data? data,
  }) {
    _message = message;
    _code = code;
    _data = data;
  }

  UserResponse.fromJson(dynamic json) {
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

/// user : {"id":5,"name":"AML GINANIA","email":"ss@maill.ru","phone":"0552837665","image":"","address":"test address","date_of_birth":"1995-08-16","marital_status":"single","block":0,"block_notes":"","wallet":100,"language":""}

class Data {
  Data({
    User? user,
  }) {
    _user = user;
  }

  Data.fromJson(dynamic json) {
    _user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  User? _user;

  User? get user => _user;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_user != null) {
      map['user'] = _user?.toJson();
    }
    return map;
  }
}

/// id : 5
/// name : "AML GINANIA"
/// email : "ss@maill.ru"
/// phone : "0552837665"
/// image : ""
/// address : "test address"
/// date_of_birth : "1995-08-16"
/// marital_status : "single"
/// block : 0
/// block_notes : ""
/// wallet : 100
/// language : ""

class User {
  User({
    int? id,
    String? name,
    String? email,
    String? phone,
    String? image,
    String? address,
    String? dateOfBirth,
    String? maritalStatus,
    int? block,
    String? blockNotes,
    int? wallet,
    String? language,
  }) {
    _id = id;
    _name = name;
    _email = email;
    _phone = phone;
    _image = image;
    _address = address;
    _dateOfBirth = dateOfBirth;
    _maritalStatus = maritalStatus;
    _block = block;
    _blockNotes = blockNotes;
    _wallet = wallet;
    _language = language;
  }

  User.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _email = json['email'];
    _phone = json['phone'];
    _image = json['image'];
    _address = json['address'];
    _dateOfBirth = json['date_of_birth'];
    _maritalStatus = json['marital_status'];
    _block = json['block'];
    _blockNotes = json['block_notes'];
    _wallet = json['wallet'];
    _language = json['language'];
  }

  int? _id;
  String? _name;
  String? _email;
  String? _phone;
  String? _image;
  String? _address;
  String? _dateOfBirth;
  String? _maritalStatus;
  int? _block;
  String? _blockNotes;
  int? _wallet;
  String? _language;

  int? get id => _id;

  String? get name => _name;

  String? get email => _email;

  String? get phone => _phone;

  String? get image => _image;

  String? get address => _address;

  String? get dateOfBirth => _dateOfBirth;

  String? get maritalStatus => _maritalStatus;

  int? get block => _block;

  String? get blockNotes => _blockNotes;

  int? get wallet => _wallet;

  String? get language => _language;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['email'] = _email;
    map['phone'] = _phone;
    map['image'] = _image;
    map['address'] = _address;
    map['date_of_birth'] = _dateOfBirth;
    map['marital_status'] = _maritalStatus;
    map['block'] = _block;
    map['block_notes'] = _blockNotes;
    map['wallet'] = _wallet;
    map['language'] = _language;
    return map;
  }
}
