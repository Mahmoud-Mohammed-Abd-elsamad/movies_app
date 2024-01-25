import 'package:hive/hive.dart';
part 'results.g.dart';
@HiveType(typeId: 01)
class Results extends HiveObject{
  @HiveField(0)
  bool? _adult;
  @HiveField(1)
  String? _backdropPath;
  @HiveField(2)
  List<int>? _genreIds;
  @HiveField(3)
  int? _id;
  @HiveField(4)
  String? _originalLanguage;
  @HiveField(5)
  String? _originalTitle;
  @HiveField(6)
  String? _overview;
  @HiveField(7)
  double? _popularity;
  @HiveField(8)
  String? _posterPath;
  @HiveField(9)
  String? _releaseDate;
  @HiveField(10)
  String? _title;
  @HiveField(11)
  bool? _video;
  @HiveField(12)
  num? _voteAverage;
  @HiveField(13)
  int? _voteCount;

  Results(
      {bool? adult,
        String? backdropPath,
        List<int>? genreIds,
        int? id,
        String? originalLanguage,
        String? originalTitle,
        String? overview,
        double? popularity,
        String? posterPath,
        String? releaseDate,
        String? title,
        bool? video,
        num? voteAverage,
        int? voteCount}) {
    if (adult != null) {
      this._adult = adult;
    }
    if (backdropPath != null) {
      this._backdropPath = backdropPath;
    }
    if (genreIds != null) {
      this._genreIds = genreIds;
    }
    if (id != null) {
      this._id = id;
    }
    if (originalLanguage != null) {
      this._originalLanguage = originalLanguage;
    }
    if (originalTitle != null) {
      this._originalTitle = originalTitle;
    }
    if (overview != null) {
      this._overview = overview;
    }
    if (popularity != null) {
      this._popularity = popularity;
    }
    if (posterPath != null) {
      this._posterPath = posterPath;
    }
    if (releaseDate != null) {
      this._releaseDate = releaseDate;
    }
    if (title != null) {
      this._title = title;
    }
    if (video != null) {
      this._video = video;
    }
    if (voteAverage != null) {
      this._voteAverage = voteAverage;
    }
    if (voteCount != null) {
      this._voteCount = voteCount;
    }
  }

  bool? get adult => _adult;
  set adult(bool? adult) => _adult = adult;
  String? get backdropPath => _backdropPath;
  set backdropPath(String? backdropPath) => _backdropPath = backdropPath;
  List<int>? get genreIds => _genreIds;
  set genreIds(List<int>? genreIds) => _genreIds = genreIds;
  int? get id => _id;
  set id(int? id) => _id = id;
  String? get originalLanguage => _originalLanguage;
  set originalLanguage(String? originalLanguage) =>
      _originalLanguage = originalLanguage;
  String? get originalTitle => _originalTitle;
  set originalTitle(String? originalTitle) => _originalTitle = originalTitle;
  String? get overview => _overview;
  set overview(String? overview) => _overview = overview;
  double? get popularity => _popularity;
  set popularity(double? popularity) => _popularity = popularity;
  String? get posterPath => _posterPath;
  set posterPath(String? posterPath) => _posterPath = posterPath;
  String? get releaseDate => _releaseDate;
  set releaseDate(String? releaseDate) => _releaseDate = releaseDate;
  String? get title => _title;
  set title(String? title) => _title = title;
  bool? get video => _video;
  set video(bool? video) => _video = video;
  num? get voteAverage => _voteAverage;
  set voteAverage(num? voteAverage) => _voteAverage = voteAverage;
  int? get voteCount => _voteCount;
  set voteCount(int? voteCount) => _voteCount = voteCount;

  Results.fromJson(Map<String, dynamic> json) {
    _adult = json['adult'];
    _backdropPath = json['backdrop_path'];
    _genreIds = json['genre_ids'].cast<int>();
    _id = json['id'];
    _originalLanguage = json['original_language'];
    _originalTitle = json['original_title'];
    _overview = json['overview'];
    _popularity = json['popularity'];
    _posterPath = json['poster_path'];
    _releaseDate = json['release_date'];
    _title = json['title'];
    _video = json['video'];
    _voteAverage = json['vote_average'];
    _voteCount = json['vote_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['adult'] = this._adult;
    data['backdrop_path'] = this._backdropPath;
    data['genre_ids'] = this._genreIds;
    data['id'] = this._id;
    data['original_language'] = this._originalLanguage;
    data['original_title'] = this._originalTitle;
    data['overview'] = this._overview;
    data['popularity'] = this._popularity;
    data['poster_path'] = this._posterPath;
    data['release_date'] = this._releaseDate;
    data['title'] = this._title;
    data['video'] = this._video;
    data['vote_average'] = this._voteAverage;
    data['vote_count'] = this._voteCount;
    return data;
  }
}
