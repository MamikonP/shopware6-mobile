import 'package:json_annotation/json_annotation.dart';

import '../../../domain/entities/product/product_param_entity.dart';

part 'product_param_model.g.dart';

@JsonSerializable()
class SortParamModel {
  const SortParamModel({this.field, this.order, this.naturalSorting = 'true'});

  factory SortParamModel.fromEntity(SortParamEntity entity) => SortParamModel(
        field: entity.field,
        order: entity.order,
        naturalSorting: entity.naturalSorting,
      );

  factory SortParamModel.fromJson(Map<String, dynamic> json) =>
      _$SortParamModelFromJson(json);

  Map<String, dynamic> toJson() => _$SortParamModelToJson(this);

  SortParamEntity toEntity() => SortParamEntity(
        field: field,
        order: order,
        naturalSorting: naturalSorting,
      );

  final String? field;
  final String? order;
  final String naturalSorting;
}

@JsonSerializable()
class ProductParamModel {
  ProductParamModel({this.page, this.limit, this.sort});

  factory ProductParamModel.fromEntity(ProductParamEntity entity) =>
      ProductParamModel(
        page: entity.page,
        limit: entity.limit,
        sort: entity.sort?.map((e) => SortParamModel.fromEntity(e)).toList(),
      );

  factory ProductParamModel.fromJson(Map<String, dynamic> json) =>
      _$ProductParamModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductParamModelToJson(this);

  final int? page;
  final int? limit;
  @JsonKey(toJson: serializeData)
  final List<SortParamModel>? sort;

  static List<Map<String, dynamic>> serializeData(
          List<SortParamModel>? models) =>
      models?.map((e) => e.toJson()).toList() ?? [];
}
