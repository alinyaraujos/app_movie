// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result_movie_get_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResultMovieGetResponse _$ResultMovieGetResponseFromJson(
        Map<String, dynamic> json) =>
    ResultMovieGetResponse(
      page: json['page'] as int,
      totalPages: json['total_pages'] as int,
      results: (json['results'] as List<dynamic>)
          .map((e) => MovieGetResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ResultMovieGetResponseToJson(
        ResultMovieGetResponse instance) =>
    <String, dynamic>{
      'page': instance.page,
      'total_pages': instance.totalPages,
      'results': instance.results,
    };
