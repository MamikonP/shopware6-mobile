import 'thumbnail_entity.dart';

class MediaEntity {
  const MediaEntity({this.url, this.thumbnails});

  final String? url;
  final List<ThumbnailEntity>? thumbnails;
}
