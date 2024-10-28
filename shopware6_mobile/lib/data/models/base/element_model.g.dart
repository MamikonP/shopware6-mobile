// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'element_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ElementModel<T> _$ElementModelFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    ElementModel<T>(
      elements: (json['elements'] as List<dynamic>?)?.map(fromJsonT).toList(),
    );

Map<String, dynamic> _$ElementModelToJson<T>(
  ElementModel<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'elements': instance.elements?.map(toJsonT).toList(),
    };
