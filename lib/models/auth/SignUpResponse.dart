/// message : "A fresh verification code has been sent to your phone number Code : 155062"
/// code : 1
/// data : {"token":"eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiZWY2OGJiODJlMWJjYjZjOWU2NTkyZmE4NzkyYjI1ZDA1YjNjOTAyMWNkMzE0Y2E3MjBmMmM2YWNlZjFmMmY4ZjJkYjIxYWZmNWMwN2NjODQiLCJpYXQiOjE2NTQ2Mjk1OTYuNTM0NTQ4MDQ0MjA0NzExOTE0MDYyNSwibmJmIjoxNjU0NjI5NTk2LjUzNDU1MzA1MDk5NDg3MzA0Njg3NSwiZXhwIjoxNjg2MTY1NTk2LjUyNjIxNzkzNzQ2OTQ4MjQyMTg3NSwic3ViIjoiNDAiLCJzY29wZXMiOltdfQ.dDeBtX5Ys-FQ1g_LL6ciIcGy8c9PgM2ELPfAqw2EeHQK0DS5G8suxtdCYRlrzPEYmiiI2Pd85IEn0Owo8Xx7VivinyyxtX9HQXoHp2Jef8E12dt6c5fl94ia4-e8YguBCVwVzQzcYSJyFbhGQBr1Hg3Xct6_PY_B4SIIGVS8__h5Iigke1mmx_wK-rzez62LlwYmfjdIVuq5NIo0hphCjSluUxo2eyG5QpQVfAIS-Jrr2YJ7FyDLW0w_VSSbNJAp2e9T2ntVOWenmKy0glU3mYYpdYSMEnrB8gICsAmhoBY07qTY4TpwcBF2nbN8WkobBzbCBqwLADYE-ti6kvXG0jB1LQDwax2xXBplxCPPA4Q_3-w1StSSfviV4GeRvNIPjZjf89b5JcRcTJpRluAvBpcq31s_ibRctAE_27b1wZbyQKzZ4YD5HxePLJ06DrqCn9g0FxmE9GnD4RzU6A3md52rZ2KiooO3MO8o31vGLYkmKuDT1_UGbNlu5TldkM9eYGYfilj-Hp9-n3juKuJDczjtZEZcPPT5icDms1UI8s4QMDB-v3YQbUP1S-lY0jPtwazCCmICYo2j_O4dolXlCr_cQ9UUAwLkjyWAL8EB7xyB3HNz12LWxDRvsNkNmzv0piXrxc2K2psRYn4VUnwE7NRDX9kYnxB-W6-QsjMF8og","user":{"id":40,"name":"PLL","email":"PLL0@gmail.com","phone":"0508000100","image":"","address":"address add 256","date_of_birth":"30-05-2000","marital_status":"married","block":0,"block_notes":"","wallet":"","language":"ar"}}

class SignUpResponse {
  SignUpResponse({
      String? message, 
      int? code, 
      Data? data,}){
    _message = message;
    _code = code;
    _data = data;
}

  SignUpResponse.fromJson(dynamic json) {
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

/// token : "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiZWY2OGJiODJlMWJjYjZjOWU2NTkyZmE4NzkyYjI1ZDA1YjNjOTAyMWNkMzE0Y2E3MjBmMmM2YWNlZjFmMmY4ZjJkYjIxYWZmNWMwN2NjODQiLCJpYXQiOjE2NTQ2Mjk1OTYuNTM0NTQ4MDQ0MjA0NzExOTE0MDYyNSwibmJmIjoxNjU0NjI5NTk2LjUzNDU1MzA1MDk5NDg3MzA0Njg3NSwiZXhwIjoxNjg2MTY1NTk2LjUyNjIxNzkzNzQ2OTQ4MjQyMTg3NSwic3ViIjoiNDAiLCJzY29wZXMiOltdfQ.dDeBtX5Ys-FQ1g_LL6ciIcGy8c9PgM2ELPfAqw2EeHQK0DS5G8suxtdCYRlrzPEYmiiI2Pd85IEn0Owo8Xx7VivinyyxtX9HQXoHp2Jef8E12dt6c5fl94ia4-e8YguBCVwVzQzcYSJyFbhGQBr1Hg3Xct6_PY_B4SIIGVS8__h5Iigke1mmx_wK-rzez62LlwYmfjdIVuq5NIo0hphCjSluUxo2eyG5QpQVfAIS-Jrr2YJ7FyDLW0w_VSSbNJAp2e9T2ntVOWenmKy0glU3mYYpdYSMEnrB8gICsAmhoBY07qTY4TpwcBF2nbN8WkobBzbCBqwLADYE-ti6kvXG0jB1LQDwax2xXBplxCPPA4Q_3-w1StSSfviV4GeRvNIPjZjf89b5JcRcTJpRluAvBpcq31s_ibRctAE_27b1wZbyQKzZ4YD5HxePLJ06DrqCn9g0FxmE9GnD4RzU6A3md52rZ2KiooO3MO8o31vGLYkmKuDT1_UGbNlu5TldkM9eYGYfilj-Hp9-n3juKuJDczjtZEZcPPT5icDms1UI8s4QMDB-v3YQbUP1S-lY0jPtwazCCmICYo2j_O4dolXlCr_cQ9UUAwLkjyWAL8EB7xyB3HNz12LWxDRvsNkNmzv0piXrxc2K2psRYn4VUnwE7NRDX9kYnxB-W6-QsjMF8og"
/// user : {"id":40,"name":"PLL","email":"PLL0@gmail.com","phone":"0508000100","image":"","address":"address add 256","date_of_birth":"30-05-2000","marital_status":"married","block":0,"block_notes":"","wallet":"","language":"ar"}

class Data {
  Data({
      String? token, 
      User? user,}){
    _token = token;
    _user = user;
}

  Data.fromJson(dynamic json) {
    _token = json['token'];
    _user = json['user'] != null ? User.fromJson(json['user']) : null;
  }
  String? _token;
  User? _user;

  String? get token => _token;
  User? get user => _user;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['token'] = _token;
    if (_user != null) {
      map['user'] = _user?.toJson();
    }
    return map;
  }

}

/// id : 40
/// name : "PLL"
/// email : "PLL0@gmail.com"
/// phone : "0508000100"
/// image : ""
/// address : "address add 256"
/// date_of_birth : "30-05-2000"
/// marital_status : "married"
/// block : 0
/// block_notes : ""
/// wallet : ""
/// language : "ar"

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
      String? wallet, 
      String? language,}){
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
  String? _wallet;
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
  String? get wallet => _wallet;
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