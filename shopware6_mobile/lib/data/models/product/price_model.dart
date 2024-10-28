import 'package:json_annotation/json_annotation.dart';

import '../../../domain/entities/product/price_entity.dart';

part 'price_model.g.dart';

@JsonSerializable()
class PriceModel {
  PriceModel({this.totalPrice});

  factory PriceModel.fromJson(Map<String, dynamic> json) =>
      _$PriceModelFromJson(json);

  Map<String, dynamic> toJson() => _$PriceModelToJson(this);

  PriceEntity toEntity() => PriceEntity(totalPrice: totalPrice);

  final num? totalPrice;
}
