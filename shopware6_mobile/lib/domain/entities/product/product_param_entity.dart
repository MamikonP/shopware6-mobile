class SortParamEntity {
  const SortParamEntity({this.field, this.order, this.naturalSorting = 'true'});

  final String? field;
  final String? order;
  final String naturalSorting;
}

class ProductParamEntity {
  const ProductParamEntity({this.page, this.limit, this.sort});

  final int? page;
  final int? limit;
  final List<SortParamEntity>? sort;
}
