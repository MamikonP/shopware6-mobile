import 'package:json_annotation/json_annotation.dart';

import '../../../domain/entities/base/translated_entity.dart';
import '../base/base_model.dart';

part 'translated_model.g.dart';

@JsonSerializable()
class TranslatedModel extends BaseModel {
  TranslatedModel({this.name, this.description});

  factory TranslatedModel.fromJson(Map<String, dynamic> json) =>
      _$TranslatedModelFromJson(json);

  Map<String, dynamic> toJson() => _$TranslatedModelToJson(this);

  TranslatedEntity toEntity() => TranslatedEntity(
        name: name,
        description: description,
      );

  final String? name;
  final String? description;
}
