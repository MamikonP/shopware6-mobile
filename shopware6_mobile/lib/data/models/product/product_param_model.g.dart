// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_param_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SortParamModel _$SortParamModelFromJson(Map<String, dynamic> json) =>
    SortParamModel(
      field: json['field'] as String?,
      order: json['order'] as String?,
      naturalSorting: json['naturalSorting'] as String? ?? 'true',
    );

Map<String, dynamic> _$SortParamModelToJson(SortParamModel instance) =>
    <String, dynamic>{
      'field': instance.field,
      'order': instance.order,
      'naturalSorting': instance.naturalSorting,
    };

ProductParamModel _$ProductParamModelFromJson(Map<String, dynamic> json) =>
    ProductParamModel(
      page: (json['page'] as num?)?.toInt(),
      limit: (json['limit'] as num?)?.toInt(),
      sort: (json['sort'] as List<dynamic>?)
          ?.map((e) => SortParamModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProductParamModelToJson(ProductParamModel instance) =>
    <String, dynamic>{
      'page': instance.page,
      'limit': instance.limit,
      'sort': ProductParamModel.serializeData(instance.sort),
    };
