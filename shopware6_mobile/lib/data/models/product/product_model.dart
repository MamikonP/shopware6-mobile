import 'package:json_annotation/json_annotation.dart';

import '../../../domain/entities/product/product_entity.dart';
import '../base/base_model.dart';
import '../base/translated_model.dart';
import 'cover_model.dart';
import 'price_model.dart';

part 'product_model.g.dart';

@JsonSerializable()
class ProductModel extends BaseModel {
  ProductModel({this.translated, this.calculatedPrice, this.cover});

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductModelToJson(this);

  ProductEntity toEntity() => ProductEntity(
      translated: translated?.toEntity(),
      cover: cover?.toEntity(),
      calculatedPrice: calculatedPrice?.toEntity());

  final TranslatedModel? translated;
  final PriceModel? calculatedPrice;
  final CoverModel? cover;
}
