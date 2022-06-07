/// message : "success"
/// code : 1
/// data : {"about_us":{"about_title":{"trans":{"ar":"من نحن","en":"About Us","ur":"About Us"}},"about_subtitle":{"trans":{"ar":"تعرف علينا","en":"Get to know us","ur":"Get to know us"}},"about_text":{"trans":{"ar":"هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي للنص أو شكل توضع الفقرات في الصفحة التي يقرأها. ولذلك يتم استخدام طريقة لوريم إيبسوم لأنها تعطي توزيعاَ طبيعياَ -إلى حد ما- للأحرف عوضاً عن استخدام \"هنا يوجد محتوى نصي، هنا يوجد محتوى نصي\" فتجعلها تبدو (أي الأحرف) وكأنها نص مقروء. العديد من برامح النشر المكتبي وبرامح تحرير صفحات الويب تستخدم لوريم إيبسوم بشكل إفتراضي كنموذج عن النص، وإذا قمت بإدخال \"lorem ipsum\" في أي محرك بحث ستظهر العديد من المواقع الحديثة العهد في نتائج البحث. على مدى السنين ظهرت نسخ جديدة ومختلفة من نص لوريم إيبسوم، أحياناً عن طريق الصدفة، وأحياناً عن عمد كإدخال بعض العبارات الفكاهية إليها.","en":"It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).<br><br>","ur":"It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).<br><br>"}},"about_image":"https://qbus.rabaaladawia.com/public/images/settings/165050955222.jpg"}}

class GetAboutUsResponse {
  GetAboutUsResponse({
    String? message,
    int? code,
    Data? data,
  }) {
    _message = message;
    _code = code;
    _data = data;
  }

  GetAboutUsResponse.fromJson(dynamic json) {
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

/// about_us : {"about_title":{"trans":{"ar":"من نحن","en":"About Us","ur":"About Us"}},"about_subtitle":{"trans":{"ar":"تعرف علينا","en":"Get to know us","ur":"Get to know us"}},"about_text":{"trans":{"ar":"هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي للنص أو شكل توضع الفقرات في الصفحة التي يقرأها. ولذلك يتم استخدام طريقة لوريم إيبسوم لأنها تعطي توزيعاَ طبيعياَ -إلى حد ما- للأحرف عوضاً عن استخدام \"هنا يوجد محتوى نصي، هنا يوجد محتوى نصي\" فتجعلها تبدو (أي الأحرف) وكأنها نص مقروء. العديد من برامح النشر المكتبي وبرامح تحرير صفحات الويب تستخدم لوريم إيبسوم بشكل إفتراضي كنموذج عن النص، وإذا قمت بإدخال \"lorem ipsum\" في أي محرك بحث ستظهر العديد من المواقع الحديثة العهد في نتائج البحث. على مدى السنين ظهرت نسخ جديدة ومختلفة من نص لوريم إيبسوم، أحياناً عن طريق الصدفة، وأحياناً عن عمد كإدخال بعض العبارات الفكاهية إليها.","en":"It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).<br><br>","ur":"It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).<br><br>"}},"about_image":"https://qbus.rabaaladawia.com/public/images/settings/165050955222.jpg"}

class Data {
  Data({
    AboutUs? aboutUs,
  }) {
    _aboutUs = aboutUs;
  }

  Data.fromJson(dynamic json) {
    _aboutUs =
        json['about_us'] != null ? AboutUs.fromJson(json['about_us']) : null;
  }

  AboutUs? _aboutUs;

  AboutUs? get aboutUs => _aboutUs;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_aboutUs != null) {
      map['about_us'] = _aboutUs?.toJson();
    }
    return map;
  }
}

/// about_title : {"trans":{"ar":"من نحن","en":"About Us","ur":"About Us"}}
/// about_subtitle : {"trans":{"ar":"تعرف علينا","en":"Get to know us","ur":"Get to know us"}}
/// about_text : {"trans":{"ar":"هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي للنص أو شكل توضع الفقرات في الصفحة التي يقرأها. ولذلك يتم استخدام طريقة لوريم إيبسوم لأنها تعطي توزيعاَ طبيعياَ -إلى حد ما- للأحرف عوضاً عن استخدام \"هنا يوجد محتوى نصي، هنا يوجد محتوى نصي\" فتجعلها تبدو (أي الأحرف) وكأنها نص مقروء. العديد من برامح النشر المكتبي وبرامح تحرير صفحات الويب تستخدم لوريم إيبسوم بشكل إفتراضي كنموذج عن النص، وإذا قمت بإدخال \"lorem ipsum\" في أي محرك بحث ستظهر العديد من المواقع الحديثة العهد في نتائج البحث. على مدى السنين ظهرت نسخ جديدة ومختلفة من نص لوريم إيبسوم، أحياناً عن طريق الصدفة، وأحياناً عن عمد كإدخال بعض العبارات الفكاهية إليها.","en":"It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).<br><br>","ur":"It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).<br><br>"}}
/// about_image : "https://qbus.rabaaladawia.com/public/images/settings/165050955222.jpg"

class AboutUs {
  AboutUs({
    AboutTitle? aboutTitle,
    AboutSubtitle? aboutSubtitle,
    AboutText? aboutText,
    String? aboutImage,
  }) {
    _aboutTitle = aboutTitle;
    _aboutSubtitle = aboutSubtitle;
    _aboutText = aboutText;
    _aboutImage = aboutImage;
  }

  AboutUs.fromJson(dynamic json) {
    _aboutTitle = json['about_title'] != null
        ? AboutTitle.fromJson(json['about_title'])
        : null;
    _aboutSubtitle = json['about_subtitle'] != null
        ? AboutSubtitle.fromJson(json['about_subtitle'])
        : null;
    _aboutText = json['about_text'] != null
        ? AboutText.fromJson(json['about_text'])
        : null;
    _aboutImage = json['about_image'];
  }

  AboutTitle? _aboutTitle;
  AboutSubtitle? _aboutSubtitle;
  AboutText? _aboutText;
  String? _aboutImage;

  AboutTitle? get aboutTitle => _aboutTitle;

  AboutSubtitle? get aboutSubtitle => _aboutSubtitle;

  AboutText? get aboutText => _aboutText;

  String? get aboutImage => _aboutImage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_aboutTitle != null) {
      map['about_title'] = _aboutTitle?.toJson();
    }
    if (_aboutSubtitle != null) {
      map['about_subtitle'] = _aboutSubtitle?.toJson();
    }
    if (_aboutText != null) {
      map['about_text'] = _aboutText?.toJson();
    }
    map['about_image'] = _aboutImage;
    return map;
  }
}

/// trans : {"ar":"هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي للنص أو شكل توضع الفقرات في الصفحة التي يقرأها. ولذلك يتم استخدام طريقة لوريم إيبسوم لأنها تعطي توزيعاَ طبيعياَ -إلى حد ما- للأحرف عوضاً عن استخدام \"هنا يوجد محتوى نصي، هنا يوجد محتوى نصي\" فتجعلها تبدو (أي الأحرف) وكأنها نص مقروء. العديد من برامح النشر المكتبي وبرامح تحرير صفحات الويب تستخدم لوريم إيبسوم بشكل إفتراضي كنموذج عن النص، وإذا قمت بإدخال \"lorem ipsum\" في أي محرك بحث ستظهر العديد من المواقع الحديثة العهد في نتائج البحث. على مدى السنين ظهرت نسخ جديدة ومختلفة من نص لوريم إيبسوم، أحياناً عن طريق الصدفة، وأحياناً عن عمد كإدخال بعض العبارات الفكاهية إليها.","en":"It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).<br><br>","ur":"It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).<br><br>"}

class AboutText {
  AboutText({
    Trans? trans,
  }) {
    _trans = trans;
  }

  AboutText.fromJson(dynamic json) {
    _trans = json['trans'] != null ? Trans.fromJson(json['trans']) : null;
  }

  Trans? _trans;

  Trans? get trans => _trans;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_trans != null) {
      map['trans'] = _trans?.toJson();
    }
    return map;
  }
}

/// ar : "هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي للنص أو شكل توضع الفقرات في الصفحة التي يقرأها. ولذلك يتم استخدام طريقة لوريم إيبسوم لأنها تعطي توزيعاَ طبيعياَ -إلى حد ما- للأحرف عوضاً عن استخدام \"هنا يوجد محتوى نصي، هنا يوجد محتوى نصي\" فتجعلها تبدو (أي الأحرف) وكأنها نص مقروء. العديد من برامح النشر المكتبي وبرامح تحرير صفحات الويب تستخدم لوريم إيبسوم بشكل إفتراضي كنموذج عن النص، وإذا قمت بإدخال \"lorem ipsum\" في أي محرك بحث ستظهر العديد من المواقع الحديثة العهد في نتائج البحث. على مدى السنين ظهرت نسخ جديدة ومختلفة من نص لوريم إيبسوم، أحياناً عن طريق الصدفة، وأحياناً عن عمد كإدخال بعض العبارات الفكاهية إليها."
/// en : "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).<br><br>"
/// ur : "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).<br><br>"

class Trans {
  Trans({
    String? ar,
    String? en,
    String? ur,
  }) {
    _ar = ar;
    _en = en;
    _ur = ur;
  }

  Trans.fromJson(dynamic json) {
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

/// trans : {"ar":"تعرف علينا","en":"Get to know us","ur":"Get to know us"}

class AboutSubtitle {
  AboutSubtitle({
    Trans? trans,
  }) {
    _trans = trans;
  }

  AboutSubtitle.fromJson(dynamic json) {
    _trans = json['trans'] != null ? Trans.fromJson(json['trans']) : null;
  }

  Trans? _trans;

  Trans? get trans => _trans;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_trans != null) {
      map['trans'] = _trans?.toJson();
    }
    return map;
  }
}

/// ar : "تعرف علينا"
/// en : "Get to know us"
/// ur : "Get to know us"

// class Trans {
//   Trans({
//     String? ar,
//     String? en,
//     String? ur,
//   }) {
//     _ar = ar;
//     _en = en;
//     _ur = ur;
//   }
//
//   Trans.fromJson(dynamic json) {
//     _ar = json['ar'];
//     _en = json['en'];
//     _ur = json['ur'];
//   }
//
//   String? _ar;
//   String? _en;
//   String? _ur;
//
//   String? get ar => _ar;
//
//   String? get en => _en;
//
//   String? get ur => _ur;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['ar'] = _ar;
//     map['en'] = _en;
//     map['ur'] = _ur;
//     return map;
//   }
// }

/// trans : {"ar":"من نحن","en":"About Us","ur":"About Us"}

class AboutTitle {
  AboutTitle({
    Trans? trans,
  }) {
    _trans = trans;
  }

  AboutTitle.fromJson(dynamic json) {
    _trans = json['trans'] != null ? Trans.fromJson(json['trans']) : null;
  }

  Trans? _trans;

  Trans? get trans => _trans;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_trans != null) {
      map['trans'] = _trans?.toJson();
    }
    return map;
  }
}

/// ar : "من نحن"
/// en : "About Us"
/// ur : "About Us"

// class Trans {
//   Trans({
//     String? ar,
//     String? en,
//     String? ur,
//   }) {
//     _ar = ar;
//     _en = en;
//     _ur = ur;
//   }
//
//   Trans.fromJson(dynamic json) {
//     _ar = json['ar'];
//     _en = json['en'];
//     _ur = json['ur'];
//   }
//
//   String? _ar;
//   String? _en;
//   String? _ur;
//
//   String? get ar => _ar;
//
//   String? get en => _en;
//
//   String? get ur => _ur;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['ar'] = _ar;
//     map['en'] = _en;
//     map['ur'] = _ur;
//     return map;
//   }
// }
