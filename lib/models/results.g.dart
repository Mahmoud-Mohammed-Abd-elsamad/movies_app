// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'results.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************


class ResultsAdapter extends TypeAdapter<Results> {
  @override
  final int typeId = 1;

  @override
  Results read(BinaryReader reader) {
    final Map<dynamic, dynamic> fields = reader.readMap();
    return Results(
      adult: fields['adult'] as bool?,
      backdropPath: fields['backdrop_path'] as String?,
      genreIds: (fields['genre_ids'] as List<dynamic>?)?.cast<int>(),
      id: fields['id'] as int?,
      originalLanguage: fields['original_language'] as String?,
      originalTitle: fields['original_title'] as String?,
      overview: fields['overview'] as String?,
      popularity: fields['popularity'] as double?,
      posterPath: fields['poster_path'] as String?,
      releaseDate: fields['release_date'] as String?,
      title: fields['title'] as String?,
      video: fields['video'] as bool?,
      voteAverage: fields['vote_average'] as num?,
      voteCount: fields['vote_count'] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, Results obj) {
    writer.writeMap(<dynamic, dynamic>{
      'adult': obj.adult,
      'backdrop_path': obj.backdropPath,
      'genre_ids': obj.genreIds,
      'id': obj.id,
      'original_language': obj.originalLanguage,
      'original_title': obj.originalTitle,
      'overview': obj.overview,
      'popularity': obj.popularity,
      'poster_path': obj.posterPath,
      'release_date': obj.releaseDate,
      'title': obj.title,
      'video': obj.video,
      'vote_average': obj.voteAverage,
      'vote_count': obj.voteCount,
    });
  }
}