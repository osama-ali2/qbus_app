/// code : 1
/// message : "saved successfully."
/// data : {"package_order_id":5}

class PackageOrderResponse {
  PackageOrderResponse({
    int? code,
    String? message,
    Data? data,
  }) {
    _code = code;
    _message = message;
    _data = data;
  }

  PackageOrderResponse.fromJson(dynamic json) {
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

/// package_order_id : 5

class Data {
  Data({
    int? packageOrderId,
  }) {
    _packageOrderId = packageOrderId;
  }

  Data.fromJson(dynamic json) {
    _packageOrderId = json['package_order_id'];
  }

  int? _packageOrderId;

  int? get packageOrderId => _packageOrderId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['package_order_id'] = _packageOrderId;
    return map;
  }
}
