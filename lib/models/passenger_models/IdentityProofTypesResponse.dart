class IdentityProofTypesResponse {
  IdentityProofTypesResponse({
      int? code, 
      String? message, 
      Data? data,}){
    _code = code;
    _message = message;
    _data = data;
}

  IdentityProofTypesResponse.fromJson(dynamic json) {
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
      List<IdentityProofTypes>? identityProofTypes,}){
    _identityProofTypes = identityProofTypes;
}

  Data.fromJson(dynamic json) {
    if (json['identity_proof_types'] != null) {
      _identityProofTypes = [];
      json['identity_proof_types'].forEach((v) {
        _identityProofTypes?.add(IdentityProofTypes.fromJson(v));
      });
    }
  }
  List<IdentityProofTypes>? _identityProofTypes;

  List<IdentityProofTypes>? get identityProofTypes => _identityProofTypes;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_identityProofTypes != null) {
      map['identity_proof_types'] = _identityProofTypes?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class IdentityProofTypes {
  IdentityProofTypes({
      String? id, 
      Name? name,}){
    _id = id;
    _name = name;
}

  IdentityProofTypes.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'] != null ? Name.fromJson(json['name']) : null;
  }
  String? _id;
  Name? _name;

  String? get id => _id;
  Name? get name => _name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    if (_name != null) {
      map['name'] = _name?.toJson();
    }
    return map;
  }

}

class Name {
  Name({
      String? ar, 
      String? en, 
      String? ur,}){
    _ar = ar;
    _en = en;
    _ur = ur;
}

  Name.fromJson(dynamic json) {
    _ar = json['ar'];
    _en = json['en'];
    _ur = json['ur'];
  }
  String? _ar;
  String? _en;
  String? _ur;

  String? get ar => _ar;
  String? get en => _en;
  String? get ur => _ur;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['ar'] = _ar;
    map['en'] = _en;
    map['ur'] = _ur;
    return map;
  }

}