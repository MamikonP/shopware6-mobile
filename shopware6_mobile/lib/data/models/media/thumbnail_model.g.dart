// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'thumbnail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ThumbnailModel _$ThumbnailModelFromJson(Map<String, dynamic> json) =>
    ThumbnailModel(
      url: json['url'] as String?,
      width: json['width'] as num?,
      height: json['height'] as num?,
    );

Map<String, dynamic> _$ThumbnailModelToJson(ThumbnailModel instance) =>
    <String, dynamic>{
      'width': instance.width,
      'height': instance.height,
      'url': instance.url,
    };
