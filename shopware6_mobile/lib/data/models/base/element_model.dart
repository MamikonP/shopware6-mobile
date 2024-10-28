import 'package:json_annotation/json_annotation.dart';

import '../base/base_model.dart';

part 'element_model.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class ElementModel<T> extends BaseModel {
  ElementModel({this.elements});

  factory ElementModel.fromJson(
          Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$ElementModelFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object Function(T value) toJsonT) =>
      _$ElementModelToJson(this, toJsonT);

  final List<T>? elements;
}
