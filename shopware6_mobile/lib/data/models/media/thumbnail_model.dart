import 'package:json_annotation/json_annotation.dart';

import '../../../domain/entities/media/thumbnail_entity.dart';

part 'thumbnail_model.g.dart';

@JsonSerializable()
class ThumbnailModel {
  ThumbnailModel({
    this.url,
    this.width,
    this.height,
  });

  factory ThumbnailModel.fromJson(Map<String, dynamic> json) =>
      _$ThumbnailModelFromJson(json);

  Map<String, dynamic> toJson() => _$ThumbnailModelToJson(this);

  ThumbnailEntity toEntity() => ThumbnailEntity(
        width: width,
        height: height,
        url: url,
      );

  final num? width;
  final num? height;
  final String? url;
}
