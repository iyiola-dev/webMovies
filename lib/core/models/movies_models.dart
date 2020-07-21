import 'result_model.dart';

class Movies {
  int page;
  List<Result> result;
  int totalResults;
  int totalPages;
  Movies({this.page, this.result, this.totalResults, this.totalPages});

  Movies.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    totalPages = json['totalPages'];
    totalResults = json['totalResult'];
    if (json['results'] != null) {
      result = List<Result>();
      json['results'].forEach((v) {
        result.add(Result.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['page'] = this.page;
    data['totalPages'] = this.totalPages;
    data['totalResults'] = this.totalResults;
    if (this.result != null) {
      data['results'] = this.result.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
