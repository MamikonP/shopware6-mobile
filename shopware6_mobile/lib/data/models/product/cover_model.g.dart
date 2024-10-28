// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cover_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoverModel _$CoverModelFromJson(Map<String, dynamic> json) => CoverModel(
      media: json['media'] == null
          ? null
          : MediaModel.fromJson(json['media'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CoverModelToJson(CoverModel instance) =>
    <String, dynamic>{
      'media': instance.media,
    };
