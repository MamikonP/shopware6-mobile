import 'package:json_annotation/json_annotation.dart';

import '../../../domain/entities/product/cover_entity.dart';
import '../media/media_model.dart';

part 'cover_model.g.dart';

@JsonSerializable()
class CoverModel {
  CoverModel({this.media});

  factory CoverModel.fromJson(Map<String, dynamic> json) =>
      _$CoverModelFromJson(json);

  Map<String, dynamic> toJson() => _$CoverModelToJson(this);

  CoverEntity toEntity() => CoverEntity(media: media?.toEntity());

  final MediaModel? media;
}
