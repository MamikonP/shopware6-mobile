enum ProductFilterCategory {
  nameAsc('name-asc', 'Name A-Z', 'name'),
  nameDesc('name-desc', 'Name Z-A', 'name'),
  priceAsc('price-asc', 'Price ascending', 'price'),
  priceDesc('price-desc', 'Price descending', 'price'),
  topseller('topseller', 'Topseller', 'name');

  const ProductFilterCategory(this.value, this.title, this.field);

  factory ProductFilterCategory.fromTitle(String title) =>
      ProductFilterCategory.values.firstWhere(
        (element) => element.title == title,
        orElse: () => ProductFilterCategory.nameAsc,
      );

  final String value;
  final String title;
  final String field;
}
