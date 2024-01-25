import 'package:movies/models/results.dart';

class SearchModel {
  int? _page;
  List<Results>? _results;
  int? _totalPages;                    //14
  int? _totalResults;

  SearchModel(
      {int? page, List<Results>? results, int? totalPages, int? totalResults}) {
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

  int? get page => _page;
  set page(int? page) => _page = page;
  List<Results>? get results => _results;
  set results(List<Results>? results) => _results = results;
  int? get totalPages => _totalPages;
  set totalPages(int? totalPages) => _totalPages = totalPages;
  int? get totalResults => _totalResults;
  set totalResults(int? totalResults) => _totalResults = totalResults;

  SearchModel.fromJson(Map<String, dynamic> json) {
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

}

