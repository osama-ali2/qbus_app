class TripFilterModel {
  String? code;
  String? date_from;
  String? date_to;
  String? time_from;
  String? from_city_id;
  String? to_city_id;
  List? additional;
  int? offset;

  TripFilterModel({
    this.code,
    this.date_from,
    this.date_to,
    this.time_from,
    this.from_city_id,
    this.to_city_id,
    this.additional,
    this.offset,
  });

  Map<String, dynamic> toJson() => {
        "code": code,
        "date_from": date_from,
        "date_to": date_to,
        "time_from": time_from,
        "from_city_id": from_city_id,
        "to_city_id": to_city_id,
        "additional": additional,
        "offset": offset
      };
}
