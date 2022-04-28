// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_get_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieGetResponse _$MovieGetResponseFromJson(Map<String, dynamic> json) =>
    MovieGetResponse(
      title: json['title'] as String,
      posterPath: json['poster_path'] as String,
      overview: json['overview'] as String,
      voteAverage: (json['vote_average'] as num).toDouble(),
    );

Map<String, dynamic> _$MovieGetResponseToJson(MovieGetResponse instance) =>
    <String, dynamic>{
      'title': instance.title,
      'poster_path': instance.posterPath,
      'overview': instance.overview,
      'vote_average': instance.voteAverage,
    };
