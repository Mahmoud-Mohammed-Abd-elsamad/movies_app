import 'package:movies/models/results.dart';

class ReleaseModel {
  Dates? _dates;
  int? _page;
  List<Results>? _results;
  int? _totalPages;
  int? _totalResults;

  ReleaseModel(
      {Dates? dates,
        int? page,
        List<Results>? results,
        int? totalPages,
        int? totalResults}) {
    if (dates != null) {
      this._dates = dates;
    }
    if (page != null) {
      this._page = page;
    }
    if (results != null) {
      this._results = results;
    }
    if (totalPages != null) {
      this._totalPages = totalPages;
    }
    if (totalResults != null) {
      this._totalResults = totalResults;
    }
  }

  Dates? get dates => _dates;
  set dates(Dates? dates) => _dates = dates;
  int? get page => _page;
  set page(int? page) => _page = page;
  List<Results>? get results => _results;
  set results(List<Results>? results) => _results = results;
  int? get totalPages => _totalPages;
  set totalPages(int? totalPages) => _totalPages = totalPages;
  int? get totalResults => _totalResults;
  set totalResults(int? totalResults) => _totalResults = totalResults;

  ReleaseModel.fromJson(Map<String, dynamic> json) {
    _dates = json['dates'] != null ? new Dates.fromJson(json['dates']) : null;
    _page = json['page'];
    if (json['results'] != null) {
      _results = <Results>[];
      json['results'].forEach((v) {
        _results!.add(new Results.fromJson(v));
      });
    }
    _totalPages = json['total_pages'];
    _totalResults = json['total_results'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._dates != null) {
      data['dates'] = this._dates!.toJson();
    }
    data['page'] = this._page;
    if (this._results != null) {
      data['results'] = this._results!.map((v) => v.toJson()).toList();
    }
    data['total_pages'] = this._totalPages;
    data['total_results'] = this._totalResults;
    return data;
  }
}

class Dates {
  String? _maximum;
  String? _minimum;

  Dates({String? maximum, String? minimum}) {
    if (maximum != null) {
      this._maximum = maximum;
    }
    if (minimum != null) {
      this._minimum = minimum;
    }
  }

  String? get maximum => _maximum;
  set maximum(String? maximum) => _maximum = maximum;
  String? get minimum => _minimum;
  set minimum(String? minimum) => _minimum = minimum;

  Dates.fromJson(Map<String, dynamic> json) {
    _maximum = json['maximum'];
    _minimum = json['minimum'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['maximum'] = this._maximum;
    data['minimum'] = this._minimum;
    return data;
  }
}


