import 'dart:convert';

import 'package:discover_movie/models/base.dart';

Response<T> responseFromJson<T extends Base>(
        String str, T factory(Map<String, dynamic> data)) =>
    Response<T>.fromJson(json.decode(str), factory);

String responseToJson(Response data) => json.encode(data.toJson());

class Response<T extends Base> extends Base {
  Response({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  int page;
  List<T> results;
  int totalPages;
  int totalResults;

  factory Response.fromJson(
          Map<String, dynamic> json, T factory(Map<String, dynamic> data)) =>
      Response<T>(
        page: json["page"],
        results: List<T>.from(json["results"].map((x) => factory(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );

  Map<String, dynamic> toJson() => {
        "page": page,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
        "total_pages": totalPages,
        "total_results": totalResults,
      };
}
