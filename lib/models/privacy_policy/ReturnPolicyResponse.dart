/// message : "success"
/// code : 1
/// data : {"return_policy":{"ur":"urIt is a long established fact that a reader will be distracted by the \r\nreadable content of a page when looking at its layout. The point of \r\nusing Lorem Ipsum is that it has a more-or-less normal distribution of \r\nletters, as opposed to using 'Content here, content here', making it \r\nlook like readable English. Many desktop publishing packages and web \r\npage editors now use Lorem Ipsum as their default model text, and a \r\nsearch for 'lorem ipsum' will uncover many web sites still in their \r\ninfancy. Various versions have evolved over the years, sometimes by \r\naccident, sometimes on purpose (injected humour and the like).<br><br><br>","ar":"arهناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي \r\nالقارئ عن التركيز على الشكل الخارجي للنص أو شكل توضع الفقرات في الصفحة \r\nالتي يقرأها. ولذلك يتم استخدام طريقة لوريم إيبسوم لأنها تعطي توزيعاَ \r\nطبيعياَ -إلى حد ما- للأحرف عوضاً عن استخدام \"هنا يوجد محتوى نصي، هنا \r\nيوجد محتوى نصي\" فتجعلها تبدو (أي الأحرف) وكأنها نص مقروء. العديد من \r\nبرامح النشر المكتبي وبرامح تحرير صفحات الويب تستخدم لوريم إيبسوم بشكل \r\nإفتراضي كنموذج عن النص، وإذا قمت بإدخال \"lorem ipsum\" في أي محرك بحث \r\nستظهر العديد من المواقع الحديثة العهد في نتائج البحث. على مدى السنين \r\nظهرت نسخ جديدة ومختلفة من نص لوريم إيبسوم، أحياناً عن طريق الصدفة، \r\nوأحياناً عن عمد كإدخال بعض العبارات الفكاهية إليها.<br>","en":"enIt is a long established fact that a reader will be distracted by the \r\nreadable content of a page when looking at its layout. The point of \r\nusing Lorem Ipsum is that it has a more-or-less normal distribution of \r\nletters, as opposed to using 'Content here, content here', making it \r\nlook like readable English. Many desktop publishing packages and web \r\npage editors now use Lorem Ipsum as their default model text, and a \r\nsearch for 'lorem ipsum' will uncover many web sites still in their \r\ninfancy. Various versions have evolved over the years, sometimes by \r\naccident, sometimes on purpose (injected humour and the like).<br><br><br>"}}

class ReturnPolicyResponse {
  ReturnPolicyResponse({
    String? message,
    int? code,
    Data? data,
  }) {
    _message = message;
    _code = code;
    _data = data;
  }

  ReturnPolicyResponse.fromJson(dynamic json) {
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

/// return_policy : {"ur":"urIt is a long established fact that a reader will be distracted by the \r\nreadable content of a page when looking at its layout. The point of \r\nusing Lorem Ipsum is that it has a more-or-less normal distribution of \r\nletters, as opposed to using 'Content here, content here', making it \r\nlook like readable English. Many desktop publishing packages and web \r\npage editors now use Lorem Ipsum as their default model text, and a \r\nsearch for 'lorem ipsum' will uncover many web sites still in their \r\ninfancy. Various versions have evolved over the years, sometimes by \r\naccident, sometimes on purpose (injected humour and the like).<br><br><br>","ar":"arهناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي \r\nالقارئ عن التركيز على الشكل الخارجي للنص أو شكل توضع الفقرات في الصفحة \r\nالتي يقرأها. ولذلك يتم استخدام طريقة لوريم إيبسوم لأنها تعطي توزيعاَ \r\nطبيعياَ -إلى حد ما- للأحرف عوضاً عن استخدام \"هنا يوجد محتوى نصي، هنا \r\nيوجد محتوى نصي\" فتجعلها تبدو (أي الأحرف) وكأنها نص مقروء. العديد من \r\nبرامح النشر المكتبي وبرامح تحرير صفحات الويب تستخدم لوريم إيبسوم بشكل \r\nإفتراضي كنموذج عن النص، وإذا قمت بإدخال \"lorem ipsum\" في أي محرك بحث \r\nستظهر العديد من المواقع الحديثة العهد في نتائج البحث. على مدى السنين \r\nظهرت نسخ جديدة ومختلفة من نص لوريم إيبسوم، أحياناً عن طريق الصدفة، \r\nوأحياناً عن عمد كإدخال بعض العبارات الفكاهية إليها.<br>","en":"enIt is a long established fact that a reader will be distracted by the \r\nreadable content of a page when looking at its layout. The point of \r\nusing Lorem Ipsum is that it has a more-or-less normal distribution of \r\nletters, as opposed to using 'Content here, content here', making it \r\nlook like readable English. Many desktop publishing packages and web \r\npage editors now use Lorem Ipsum as their default model text, and a \r\nsearch for 'lorem ipsum' will uncover many web sites still in their \r\ninfancy. Various versions have evolved over the years, sometimes by \r\naccident, sometimes on purpose (injected humour and the like).<br><br><br>"}

class Data {
  Data({
    ReturnPolicy? returnPolicy,
  }) {
    _returnPolicy = returnPolicy;
  }

  Data.fromJson(dynamic json) {
    _returnPolicy = json['return_policy'] != null
        ? ReturnPolicy.fromJson(json['return_policy'])
        : null;
  }

  ReturnPolicy? _returnPolicy;

  ReturnPolicy? get returnPolicy => _returnPolicy;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_returnPolicy != null) {
      map['return_policy'] = _returnPolicy?.toJson();
    }
    return map;
  }
}

/// ur : "urIt is a long established fact that a reader will be distracted by the \r\nreadable content of a page when looking at its layout. The point of \r\nusing Lorem Ipsum is that it has a more-or-less normal distribution of \r\nletters, as opposed to using 'Content here, content here', making it \r\nlook like readable English. Many desktop publishing packages and web \r\npage editors now use Lorem Ipsum as their default model text, and a \r\nsearch for 'lorem ipsum' will uncover many web sites still in their \r\ninfancy. Various versions have evolved over the years, sometimes by \r\naccident, sometimes on purpose (injected humour and the like).<br><br><br>"
/// ar : "arهناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي \r\nالقارئ عن التركيز على الشكل الخارجي للنص أو شكل توضع الفقرات في الصفحة \r\nالتي يقرأها. ولذلك يتم استخدام طريقة لوريم إيبسوم لأنها تعطي توزيعاَ \r\nطبيعياَ -إلى حد ما- للأحرف عوضاً عن استخدام \"هنا يوجد محتوى نصي، هنا \r\nيوجد محتوى نصي\" فتجعلها تبدو (أي الأحرف) وكأنها نص مقروء. العديد من \r\nبرامح النشر المكتبي وبرامح تحرير صفحات الويب تستخدم لوريم إيبسوم بشكل \r\nإفتراضي كنموذج عن النص، وإذا قمت بإدخال \"lorem ipsum\" في أي محرك بحث \r\nستظهر العديد من المواقع الحديثة العهد في نتائج البحث. على مدى السنين \r\nظهرت نسخ جديدة ومختلفة من نص لوريم إيبسوم، أحياناً عن طريق الصدفة، \r\nوأحياناً عن عمد كإدخال بعض العبارات الفكاهية إليها.<br>"
/// en : "enIt is a long established fact that a reader will be distracted by the \r\nreadable content of a page when looking at its layout. The point of \r\nusing Lorem Ipsum is that it has a more-or-less normal distribution of \r\nletters, as opposed to using 'Content here, content here', making it \r\nlook like readable English. Many desktop publishing packages and web \r\npage editors now use Lorem Ipsum as their default model text, and a \r\nsearch for 'lorem ipsum' will uncover many web sites still in their \r\ninfancy. Various versions have evolved over the years, sometimes by \r\naccident, sometimes on purpose (injected humour and the like).<br><br><br>"

class ReturnPolicy {
  ReturnPolicy({
    String? ur,
    String? ar,
    String? en,
  }) {
    _ur = ur;
    _ar = ar;
    _en = en;
  }

  ReturnPolicy.fromJson(dynamic json) {
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
