// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) => ProductModel(
      translated: json['translated'] == null
          ? null
          : TranslatedModel.fromJson(
              json['translated'] as Map<String, dynamic>),
      calculatedPrice: json['calculatedPrice'] == null
          ? null
          : PriceModel.fromJson(
              json['calculatedPrice'] as Map<String, dynamic>),
      cover: json['cover'] == null
          ? null
          : CoverModel.fromJson(json['cover'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProductModelToJson(ProductModel instance) =>
    <String, dynamic>{
      'translated': instance.translated,
      'calculatedPrice': instance.calculatedPrice,
      'cover': instance.cover,
    };
