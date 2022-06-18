class PackageFilterModel {
  String? code;
  String? date_from;
  String? date_to;
  String? time_from;
  String? starting_city_id;
  List? additional;
  int? offset;

  PackageFilterModel(
      {this.code,
      this.date_from,
      this.date_to,
      this.time_from,
      this.starting_city_id,
      this.additional,
      this.offset});

  Map<String, dynamic> toJson() => {
        "code": code ?? "",
        "date_from": date_from ?? "",
        "date_to": date_to ?? "",
        "time_from": time_from ?? "",
        "starting_city_id": starting_city_id ?? "",
        "additional": additional ?? [],
        "offset": offset ?? 0,
      };
}
