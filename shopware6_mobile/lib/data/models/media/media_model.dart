import 'package:json_annotation/json_annotation.dart';

import '../../../domain/entities/media/media_entity.dart';
import '../base/base_model.dart';
import 'thumbnail_model.dart';

part 'media_model.g.dart';

@JsonSerializable()
class MediaModel extends BaseModel {
  MediaModel({this.url, this.thumbnails});

  factory MediaModel.fromJson(Map<String, dynamic> json) =>
      _$MediaModelFromJson(json);

  Map<String, dynamic> toJson() => _$MediaModelToJson(this);

  MediaEntity toEntity() => MediaEntity(
        url: url,
        thumbnails: thumbnails
            ?.map(
              (e) => e.toEntity(),
            )
            .toList(),
      );

  final String? url;
  final List<ThumbnailModel>? thumbnails;
}
